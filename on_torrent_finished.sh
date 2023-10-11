#!/bin/bash

F="$1"

if [ -d "$F" ]; then
	touch "$F/DOWNLOADING_FINISHED"
else
	touch "${F%/*}/DOWNLOADING_FINISHED"
fi
