function lastrun {
  history | tail -2 | awk '{print $2; exit}'
}


# dreampie with the current virtualenv
# http://xion.org.pl/2012/05/10/dreampie-with-virtualenv/
alias dream='(dreampie $(which python) &>/dev/null &)'
