TRASH_FILE_COUNT_THRESHOLD=15
DOWNLOADS_FILE_COUNT_THRESHOLD=1


DOWNLOADS_FILE_COUNT=$(ls ~/Downloads/ | wc -l)
TRASH_FILE_COUNT=$(gvfs-ls trash:// | wc -l)

if [ $DOWNLOADS_FILE_COUNT -gt $DOWNLOADS_FILE_COUNT_THRESHOLD ] || [ $TRASH_FILE_COUNT -gt $TRASH_FILE_COUNT ]; then
    SCRIPT_LOCATION=~/Scripts/file-cleaner/file-cleaner.js

    export DISPLAY=:0.0
    gnome-terminal -e "node $SCRIPT_LOCATION"
fi

# --window-with-profile=FileCleaner