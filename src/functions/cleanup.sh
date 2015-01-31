# ### cleanupTodo
#
# The cleanupTodo is a list of commands that are to be executed upon cleanup.
# The commands are stored **in reverse order**.
cleanupTodo=''

# ### cleanupDelimiter
#
# The cleanupDelimiter is the character that separates cleanup commands.
cleanupDelimiter=';'

# ### cleanup-add()
#
# accepts one argument now
cleanup-add() {
    cleanupTodo="$1${cleanupDelimiter}${cleanupTodo}"
}

# ## cleanup()
#
# executed on exit
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
