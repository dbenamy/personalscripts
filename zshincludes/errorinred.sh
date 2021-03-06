



# see https://github.com/sickill/stderred
if [[ -f "$SCRIPTS_DIR/src/stderred/build/libstderred.so" ]]
then
    # preloads are different on different machines
    case "$OSTYPE" in
        linux*)
	    export LD_PRELOAD="$SCRIPTS_DIR/src/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
	    ;;
	darwin*)
	   export DYLD_INSERT_LIBRARIES="$SCRIPTS_DIR/src/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
	    ;;
	*)   
	    echo "[errorinred.sh] platform $OSTYPE not found."
	    ;;
    esac
else
    echo "[errorinred.sh] libstderred.so not found."
fi
    
