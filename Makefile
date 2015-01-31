
.PHONY: all clean

all: installer.sh

installer.sh: condensed.sh
	cp "$<" "$@"
	chmod u+x "$@"

merged.sh: src/functions/* src/main.sh
	echo "#!/bin/bash" > "$@"
	cat $^ >> "$@" || (rm -f "$@"; exit 1)

condensed.sh: merged.sh
	tools/condense < "$<" > "$@"

clean:
	rm -f merged.sh
	rm -f condensed.sh
	rm -f installer.sh
