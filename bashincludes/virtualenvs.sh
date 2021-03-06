
export PYTHON_ENVS=/home/swirepe/envs

function activate () {
    ENV_NAME="$1"
    
    if [ -e "$PYTHON_ENVS/$ENV_NAME/bin/activate" ]
    then
        source $PYTHON_ENVS/$ENV_NAME/bin/activate
    else
        echo "Cannot find python virtual environment: $ENV_NAME"
    fi      
}


# guess who just installed virtualenvwrapper?
# http://virtualenvwrapper.readthedocs.org/en/latest/index.html
#export WORKON_HOME=$PYTHON_ENVS
#source /usr/local/bin/virtualenvwrapper.sh
