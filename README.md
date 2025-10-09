# dotfiles

<!-- toc GFM -->

- [**c**hrissx **A**rch **a**nd **M**anjaro **O**S (`caamo`)](#chrissx-arch-and-manjaro-os-caamo)
- [**c**hrissx **M**edia **m**acOS **S**etup **S**cripts (`cmmss`)](#chrissx-media-macos-setup-scripts-cmmss)
  - [Other software (esp. audio plugins)](#other-software-esp-audio-plugins)
- [Updating](#updating)

<!-- toc -->

A bunch of `dotfiles` and scripts for installing them with GNU Stow, as well as
installing all of the actual packages.

## **c**hrissx **A**rch **a**nd **M**anjaro **O**S (`caamo`)

> [!WARNING]
> CAAMO has been deprecated and will be removed/replaced soon.

A very thin layer on top of your preferred Arch-based install. Mainly developed
for and tested on Manjaro KDE.

```sh
curl -L https://github.com/pixelcmtd/dotfiles/raw/daddy/install | sh -s caamo
```

## **c**hrissx **M**edia **m**acOS **S**etup **S**cripts (`cmmss`)

A set of scripts for easily installing a lot of packages and configuration,
primarily on "Apple silicon" (ARM), currently macOS 15 Sequoia.

We won't bother to support older macOS versions, because there is virtually no
reason to not use an up-to-date version. If you want to use it on another
version, patching it should be pretty easy though.

> [!WARNING]
> Using CMMSS on Intel-based Macs is deprecated. There is currently no easy way
> to very that it actually works, and some hacks specific to Intel macOS will be
> removed in the future.

> [!NOTE]
> CMMSS should work on macOS 26, but it is currently untested.

- Install [XCode](https://apps.apple.com/de/app/xcode/id497799835) from the App
  Store (`open -a "App Store" https://apps.apple.com/de/app/xcode/id497799835`)
- Run `sudo xcodebuild -license` and agree to the license
- Run
  `curl -L https://github.com/pixelcmtd/dotfiles/raw/daddy/install | sh -s cmmss`
- Open iTerm, go to the Preferences (⌘,): General → Preferences →
  `Load preferences from a custom folder or URL` →
  `/Users/your_name/src/pixelcmtd/dotfiles/cmmss`

### Other software (esp. audio plugins)

A lot of software, especially audio plugins, isn't in Homebrew, or otherwise
easily automatable. This may be seen as a long to-do list.

- [TinkerTool](https://www.bresink.com/osx/0TinkerTool/download.php)
- [XLN](https://www.xlnaudio.com/install)
- [destroyfx](http://destroyfx.org)
- [Ample](https://www.amplesound.net/en/download.asp)
- [Plugin Alliance](https://www.plugin-alliance.com/en/installation-manager.html#downloads)
- Antares (installed through my Homebrew)
- Native Access (installed through Homebrew)
- Softube Central (installed through Homebrew)
- [GVST](https://www.gvst.co.uk/downloads.htm)
- [Melodyne](https://services.celemony.com/cgi-bin/WebObjects/LicenseApp.woa/wa/LoginDA)

## Updating

Using `topgrade` to update all installed packages is recommended. To keep
configurations in sync, `git pull && ./run base` (maybe `./run cmmss`,
`./run caamo`, etc) should usually do the trick. In some cases, manual patches
might be required after major changes.
