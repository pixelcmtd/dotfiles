# dotfiles

A bunch of `dotfiles` and scripts for installing them with GNU Stow, as well as
installing all of the actual packages.

## chrissx Arch And Manjaro Os

A very thin layer on top of your preferred Arch-based install. Mainly developed
for and tested on Manjaro KDE.

```sh
curl -L https://github.com/pixelcmtd/dotfiles/raw/daddy/install | sh -s caamo
```

## chrissx Media macOS Setup Scripts

A set of scripts for easily installing a lot of packages and configuration,
primarily on "Apple silicon" (ARM), currently macOS 12 Monterey.

We won't bother to support older macOS versions, because there is virtually no
reason to not use the latest one. If you want to use it on another version,
patching it should be pretty easy though. Using CMMSS on Intel-based Macs is
also untested, but it _should_ just work.

- Install [iTerm](https://iterm2.com/downloads/stable/latest)
- Install [XCode](https://apps.apple.com/de/app/xcode/id497799835) from the App
  Store (`open -a "App Store" https://apps.apple.com/de/app/xcode/id497799835`)
- Run `sudo xcodebuild -license` and agree to the license
- Run
  `curl -L https://github.com/pixelcmtd/dotfiles/raw/daddy/install | sh -s cmmss`
- iTerm Preferences: General → Preferences →
  `Load preferences from a custom folder or URL` →
  `/Users/your_name/dotfiles/cmmss`

### Audio plugins

Many audio plugins aren't in Homebrew, or otherwise easily automateable.

- [XLN](https://www.xlnaudio.com/install)
- [destroyfx](http://destroyfx.org)
- [Ample](https://www.amplesound.net/en/download.asp)
- Antares (installed through my Homebrew)
- Native Access (installed through Homebrew)
- Softube Central (installed through Homebrew)
- Surge (installed through Homebrew)
- Surge XT (installed through Homebrew)
- [GVST](https://www.gvst.co.uk/downloads.htm)
