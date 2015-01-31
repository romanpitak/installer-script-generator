
# Set signal traps
trap 'trap-INT-callback' INT
trap 'trap-TERM-callback' TERM
trap 'trap-EXIT-callback' EXIT

# ## MAIN part
#
# Execute what we came here to do
echo "This is what I do."

# ## END
#
# Here the script ends.
#
# `trap-EXIT-callback` will be called which in turn calls `cleanup`
