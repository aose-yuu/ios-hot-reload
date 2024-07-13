#!/bin/bash

INSTALL_DIR="$HOME/.ios-hot-reload"
BIN_DIR="$INSTALL_DIR/bin"

echo "Installing ios-hot-reload and dependencies..."

# Create installation directory
mkdir -p "$BIN_DIR"

# Install fswatch if not already installed
if ! command -v fswatch &> /dev/null; then
    if command -v brew &> /dev/null; then
        brew install fswatch
    else
        echo "Error: Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
fi

# Copy the ios-hot-reload script to the installation directory
cp ios-hot-reload "$BIN_DIR"

# Make the script executable
chmod +x "$BIN_DIR/ios-hot-reload"

# Create completion script
COMPLETION_SCRIPT="/usr/local/etc/bash_completion.d/ios-hot-reload"
cat > "$COMPLETION_SCRIPT" << EOL
_ios_hot_reload_completions()
{
  local cur=\${COMP_WORDS[COMP_CWORD]}
  local opts="run update uninstall version -v --version"
  
  COMPREPLY=( \$(compgen -W "\${opts}" -- \${cur}) )
}

complete -F _ios_hot_reload_completions ios-hot-reload
EOL

# Update shell configuration
SHELL_CONFIG="$HOME/.zshrc"
if [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

if ! grep -q "$BIN_DIR" "$SHELL_CONFIG"; then
    echo "" >> "$SHELL_CONFIG"
    echo "# ios-hot-reload PATH addition" >> "$SHELL_CONFIG"
    echo "export PATH=\"\$PATH:$BIN_DIR\"" >> "$SHELL_CONFIG"
fi

echo "ios-hot-reload has been installed to $BIN_DIR"
echo "Completion script has been added to $COMPLETION_SCRIPT"
echo "Please restart your terminal or run 'source $SHELL_CONFIG' to apply changes."
echo "Installation completed."
