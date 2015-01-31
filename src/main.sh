# Set signal traps
trap 'trap-INT-callback' INT
trap 'trap-TERM-callback' TERM
trap 'trap-EXIT-callback' EXIT

# Execute what we came here to do
echo "This is what I do."
