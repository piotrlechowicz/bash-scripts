#!/bin/sh
# recursive-windows-encoding-fix
# iterate through each folder and file and fix weird filenames encodings

find . -type f -print0 |
while IFS= read -r -d '' src_file; do
	# sanitize destination name
	dst_file=$(echo "$src_file" | sed -re "s/[^./a-zA-Z0-9]+/_/g")
	echo "moving src file: $src_file to $dst_file"
	# check if source and destination file is the same
	if [ "$src_file" == "$dst_file" ]; then
		# no need to copy anything
		echo "src and dest are the same, i'm skipping this iteration"
		continue
	fi
	# check if directories are the same
	src_dir=$(dirname "$src_file")
	dst_dir=$(dirname "$dst_file")
	if [ "$src_dir" == "$dst_dir" ]; then
		# dirs are the same, no need to create new dir and remove an old one
		echo "dirs are the same"
		mv "$src_file" "$dst_file"
	else
		# dirs are not the same
		# create new dir
		mkdir -p "$dst_dir"
		# move content
		mv "$src_file" "$dst_file"
		# check if old dir is empty, and if so, remove it
		echo "checking if $src_dir is empty"
		if [ ! "$(ls -A '$src_dir')" ]; then
			 echo "removing $src_dir"
			 rmdir "$src_dir"
		fi
	fi
done

