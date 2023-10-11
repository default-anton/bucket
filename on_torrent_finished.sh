#!/bin/bash

CONTENT_PATH="$1"
TORRENT_NAME="$2"

if [ -d "$CONTENT_PATH" ]; then
	echo "${CONTENT_PATH}" > "${CONTENT_PATH}/${TORRENT_NAME}.downloading_finished"
else
	echo "${CONTENT_PATH}" > "${CONTENT_PATH%/*}/${TORRENT_NAME}.downloading_finished"
fi
