
# ## Various trap callbacks

trap-INT-callback() {
    echo "INT signal received"
    cleanup
}

trap-TERM-callback() {
    echo "TERM signal received"
    cleanup
}

# ### EXIT callback

trap-EXIT-callback() {
    if test 0 -eq $?; then
        echo "Success!"
    else
        >&2 echo "Fatal error on command: ${BASH_COMMAND:-"Unknown"}"
    fi
    cleanup
}
