
    #!/bin/bash

### cleanupTodo

The cleanupTodo is a list of commands that are to be executed upon cleanup.
The commands are stored **in reverse order**.

    cleanupTodo=''

### cleanupDelimiter

The cleanupDelimiter is the character that separates cleanup commands.

    cleanupDelimiter=';'

### cleanup-add()

accepts one argument now

    cleanup-add() {
        cleanupTodo="$1${cleanupDelimiter}${cleanupTodo}"
    }

## cleanup()

executed on exit

    cleanup() {
        echo "Cleaning up..."
        set +ueo pipefail # exit "strict" mode
        oldIFS="${IFS}"
        IFS=';';
        for cleanupTask in ${cleanupTodo}; do
            eval "${cleanupTask}"
        done
        IFS="${oldIFS}"
        echo -e "\tDone."
    }

## Various trap callbacks

    trap-INT-callback() {
        echo "INT signal received"
        cleanup
    }

    trap-TERM-callback() {
        echo "TERM signal received"
        cleanup
    }

### EXIT callback

    trap-EXIT-callback() {
        if test 0 -eq $?; then
            echo "Success!"
        else
            >&2 echo "Fatal error on command: ${BASH_COMMAND:-"Unknown"}"
        fi
        cleanup
    }

Set signal traps

    trap 'trap-INT-callback' INT
    trap 'trap-TERM-callback' TERM
    trap 'trap-EXIT-callback' EXIT

## MAIN part

Execute what we came here to do

    echo "This is what I do."

## END

Here the script ends.

`trap-EXIT-callback` will be called which in turn calls `cleanup`
