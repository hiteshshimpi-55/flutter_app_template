#! usr/bin/bash

if[ $# -ne 1]; then
	echo "Usage: $0 <your repo url>
	exit 1	
fi

rmdir .git


git init


git remote add origin $1


