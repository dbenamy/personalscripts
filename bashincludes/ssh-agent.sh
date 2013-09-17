# start the ssh agent when making a new shell
# and kill it when leaving
# http://mah.everybody.org/docs/ssh
# http://www.electricmonk.nl/log/2012/04/24/re-use-existing-ssh-agent-cygwin-et-al/


echo "Starting ssh agent."


SSH_AUTH_SOCK="$HOME/.ssh-socket"


SSHAGENT=/usr/bin/ssh-agent

ssh-add -l &> /dev/null
if [ $? == 2 ]
then
    #  ssh-agent isn't running
    rm -rf $SSH_AUTH_SOCK
    if [[ -x "$SSHAGENT" ]]
    then
        eval `$SSHAGENT -s -a $SSH_AUTH_SOCK` &> /dev/null
        # this would kill the agent when we exit, but we are sharing that agent now
        #trap "kill $SSH_AGENT_PID" 0
    fi
fi


if [[ ! -z "$SSH_AUTH_SOCK" ]]
then
    # now add in our private keys
    for pubkey in $(ls ~/pers/keys/*.pub)
    do 
        # builtin echo $pubkey | sed 's/....$//' | xargs ssh-add
    
        # strip off the last 4 characters so we get a private key
        echo "$(builtin echo $pubkey | sed 's/....$//' | xargs ssh-add)" # &> /dev/null
    done
fi


# get rid of those old variables
unset SSHAGENT
unset SSHAGENTARGS



