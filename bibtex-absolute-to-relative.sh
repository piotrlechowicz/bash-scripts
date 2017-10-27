#!/bin/bash

# Script which changes absolute paths in bibtex files to relative ones.
# It can be used with docear and jabref;
# In bibtex file you can define following line:
# 		@comment{jabref-meta: fileDirectory:/home/plechowicz/Documents/literature/articles/networks/;}
# which defines path to repository with pdf articles.
# Note, that it is possible to use relative path, but it is not possible when using symlinks

# variables

LAST_DIR_IN_ABSOLUTE_PATH=""	# last part of absolute path, which has to be changed to relative one
BIBTEX_FILE=""					# bibtex input file

# show usage
function show_help {
cat << EOF
usage: $0 file_name last_dir
	file_name	:	bibtex file name
	last_dir 	:	last directory in an absolutive path

This script changes file tag in bibtex entries in such a way that they are
pointing with the relative path. Last removed dir in absolute path is 
recognized by <last-dir> parameter. If file tag already starts with relative path,
this tag is omitted. 
EOF
}

# parse parameters
function read_variables {
	if [ -z "$1" ]; then
		echo -e "\error: bibtex filename has to be provided\n"
		show_help
		exit 42
	fi
	BIBTEX_FILE="$1"
	if [ -z "$2" ]; then
		echo -e "\error: last directory in an absolutive path has to be provided\n":
		show_help
		exit 42
	fi
	LAST_DIR_IN_ABSOLUTE_PATH="$2"
}

read_variables $@

# execution of awk - search and replace

awk -i inplace -v INPLACE_SUFFIX=.bak '\
{
	# pattern: __file___=___{
	if ($0 ~ /\s*file\s*=\s*{/) {
		# pattern: {_:_/ ^}* / last_dir / -> {:
		sub(/{\s*:\s*\/[^}]*\/'$LAST_DIR_IN_ABSOLUTE_PATH'\//, "{:");
		print
	} else {
		print 
	}
}
' $BIBTEX_FILE


