# Homebrew Tap: Therion Studio

Homebrew tap repository:

- `https://github.com/ladislavb/homebrew-therion-studio`

Homebrew tap name (shorthand derived from the repository name) is:

- `ladislavb/therion-studio`

## Requirements

- macOS Sequoia (15) or newer
- Homebrew

## Install

```sh
brew tap ladislavb/therion-studio
brew install therion-studio
```

Or install in one step:

```sh
brew install ladislavb/therion-studio/therion-studio
```

## Upgrade

```sh
brew update
brew upgrade therion-studio
```

## Uninstall

```sh
brew uninstall therion-studio
```

Optional: remove the tap if you no longer use it:

```sh
brew untap ladislavb/therion-studio
```

## Verify Install

```sh
brew info therion-studio
therion-studio --help
```

## Notes

- Therion Studio installs `TherionStudio.app` and a `therion-studio` launcher.
- The external Therion CLI is not bundled. Install it separately if needed:

```sh
brew install therion
```
