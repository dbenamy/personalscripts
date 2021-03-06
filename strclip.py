#!/usr/bin/python
import argparse
import re
import string
import sys

lineLength = 10


# nothing to do if you want negative line lengths
if lineLength < 0:
    sys.exit(1)


# via http://serverfault.com/questions/71285/in-centos-4-4-how-can-i-strip-escape-sequences-from-a-text-file
asciiEscapes = re.compile('\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]')

def withoutColors(line, lineLength, indicator=''):
    line = re.sub(asciiEscapes, '', line)
    return colorAgnostic(line, lineLength, indicator)


def getColorlessLength(line):
    """Get the length of a line, ignoring ansi escapes"""
    return len(re.sub(asciiEscapes, '', line))



def withColors(line, lineLength, indicator=''):
    # the starts and ends of all escape sequences
    escpairs = [(esc.start(), esc.end()) for esc in re.finditer(asciiEscapes, line)]
    
    escranges = [ range(start, end) for (start, end) in escpairs ]
    
    newline = []
    length = 0
    # go through the characters, ignoring the escape characters, accumulating until we hit the limit
    for index, char in enumerate(line):
        for start, end in escpairs:
            if index == start:
                newline.extend( line[start:end] )
        
        if any([index in r for r in escranges]):
            continue
            
        if length < lineLength:
            length += 1
            newline.append( tuple(char) )
            
    # now go back through and replace the last n tuples with the characters of the indicator
    indicatorLen = len(indicator)
    if indicatorLen != 0 and length == lineLength:
        indicatorIndex = len(indicator) - 1
        lineIndex = len(newline) - 1
        
        while lineIndex >= 0 and indicatorIndex >= 0:
            if isinstance(newline[lineIndex], tuple):
                
                newline[lineIndex] = indicator[indicatorIndex]
                indicatorIndex -= 1
                
            lineIndex -= 1
        
    # now join it all together
    retline = ""
    for item in newline:
        if isinstance(item, tuple):
            retline += item[0]
        else:
            retline += item
    
    return retline
    


def colorAgnostic(line, lineLength, indicator=''):
    indicatorLen = length(indicator)
    if len(line) > lineLength:
        line = line[:lineLength]
        
        if indicatorLen > 0:
            line = line[:-indicatorLen]
            line += indicator
            
    return line
    
    
def pad(line, lineLength):
    line += ' ' * (lineLength - getColorlessLength(line))
    return line



if __name__ == "__main__":
    
    parser = argparse.ArgumentParser(description="Clip lines down to a certain length.", conflict_handler='resolve')
    parser.add_argument("length", default=lineLength, help="The maximum length for each string.", nargs='?', type=int)
    parser.add_argument("-l", "--length", default=lineLength, help="The maximum length for each string.", type=int)
    parser.add_argument("-i", "--indicator", help="The string to append to show a line has gone over the maximum length.", default='', type=str)
    parser.add_argument("-c", "--color", help="Attempt to preserve colors as they come in.", default=False,  action='store_true')
    parser.add_argument("-s", "--strip-color", help="Strip out colors (ANSI escapes), no matter what.", default=False,  action='store_true')
    parser.add_argument("-p", "--pad", help="Fill the remaining length with whitespace", default=False,  action='store_true')
    
    args = parser.parse_args()
    lineLength = args.length
    indicator = args.indicator
    indicatorLen = len(indicator)
    

    linefn = colorAgnostic
    if args.color:
        linefn = withColors
    elif args.strip_color:
        linefn = withoutColors
    
    
    if args.pad:
        padfn = pad
    else:
        padfn = lambda line, x: line
    
    try:
        while True:
            line = raw_input()
            line = linefn(line, lineLength, indicator)
            line = padfn(line, lineLength)
            print line
    except:
        pass
