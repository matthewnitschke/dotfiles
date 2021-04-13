EXTENSION_IDS=(
    dracula-theme.theme-dracula
    waderyan.gitblame
    earshinov.sort-lines-by-selection
)

for EXTENSION_ID in $EXTENSION_IDS
do
    echo "Installing vscode extension: $EXTENSION_ID"
    code --install-extension "$EXTENSION_ID"
done