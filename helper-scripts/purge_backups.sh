#!/usr/bin/env bash

dir="$1"
min_dirs=3

[[ $(find "$dir" -maxdepth 1 -name 'mailcow-*' -type d | wc -l) -ge $min_dirs ]] && \
	IFS= read -r -d $'\0' line < <(find "$dir" -maxdepth 1 -name 'mailcow-*' -printf '%T@ %p\0' 2>/dev/null | sort -z -n)

file="${line#* }"
[[ -d ${file} ]] && ls -lLd "$file" >/dev/null && \
	rm -rf "$file"
	# rm --verbose -rf "$file"
