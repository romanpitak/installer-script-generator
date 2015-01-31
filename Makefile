
.PHONY: all clean

all: installer.sh

installer.sh: merged.sh
	cp "$<" "$@"
	chmod u+x "$@"

merged.sh: src/functions/* src/main.sh
	echo "#!/bin/bash" > "$@"
	cat $^ >> "$@" || (rm -f "$@"; exit 1)

clean:
	rm -f merged.sh
	rm -f installer.sh
