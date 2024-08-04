# iOS Hot Reload

![ios-hot-reload-demo](https://github.com/user-attachments/assets/2eb142eb-8d75-4ed6-9bc1-40da3e64ef1e)

<p align="center">
  <a href="https://github.com/aose-yuu/ios-hot-reload/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/aose-yuu/ios-hot-reload" alt="License">
  </a>
  <a href="https://github.com/aose-yuu/ios-hot-reload/issues">
    <img src="https://img.shields.io/github/issues/aose-yuu/ios-hot-reload" alt="Issues">
  </a>
  <a href="https://github.com/aose-yuu/ios-hot-reload/stargazers">
    <img src="https://img.shields.io/github/stars/aose-yuu/ios-hot-reload" alt="Stars">
  </a>
</p>

<p align="center">
  A command-line tool for iOS development that provides hot reload functionality, automatically detecting changes in your Xcode project, rebuilding, and relaunching the app in the iOS Simulator.
</p>

## ✨ Features

- 🌟 Can be called from anywhere, but only works in Xcode project directories
- 🔍 Automatically detects Xcode project or workspace
- 👀 Monitors file changes in the project directory
- 🚀 Automatically builds and runs the app when changes are detected
- 🔒 Prevents multiple simultaneous builds
- 🔙 Returns focus to the original application after building and running
- 🏗️ Works with both `.xcodeproj` and `.xcworkspace` project formats
- 🔄 Executes `tuist generate` before each build to ensure up-to-date project files

## 🔧 Prerequisites

- Xcode Command Line Tools
- `fswatch` (can be installed via Homebrew: `brew install fswatch`)
- [`tuist`](https://github.com/tuist/tuist?tab=readme-ov-file) (for projects using Tuist)

## 📦 Installation

1. Clone this repository:

```bash
git clone https://github.com/aose-yuu/ios-hot-reload.git
```

2. Navigate to the cloned directory:

```bash
cd ios-hot-reload
```

3. Run the install script:

```bash
sudo ./install.sh
```

The script will be installed to `/usr/local/bin` and will be available system-wide.

4. Reload `.zshrc`

Please restart your terminal or run `source ~/.zshrc` to apply changes.

## 🗑 Uninstallation

1. To remove ios-hot-reload from your system

run the following command:

```bash
ios-hot-reload uninstall
```

2. Reload `.zshrc`

Please restart your terminal or run `source ~/.zshrc` to apply changes.

## 🚀 Usage

1. Navigate to your Xcode project's root directory in the terminal.
2. Run the command:

```bash
ios-hot-reload run
```

3.The script will start monitoring for file changes. Any changes in the project directory will trigger a tuist generate command, followed by a rebuild and relaunch of the app in the iOS Simulator. 

## 📝 Notes

- The command will only work when run from the root directory of an Xcode project.
- The script uses osascript, which may require privacy permissions. You may need to grant appropriate permissions in System Preferences > Security & Privacy > Privacy > Accessibility.
- The script is set to ignore rapid successive changes (within 5 seconds) to prevent unnecessary rebuilds.
- If you encounter any issues with app name or bundle ID detection, you may need to adjust the relevant parts of the script.
- The script now includes a tuist generate step before each build. Ensure that your project is set up to use Tuist if you want to take advantage of this feature.

## 🤝 Contributing

Contributions to improve the script are welcome. Please feel free to submit a Pull Request.

## 📄 License

This script is released under the MIT License. See the LICENSE file for details.

<p align="center">
Made with ❤️ by <a href="https://github.com/aose-yuu">aose-yuu</a>
</p>
