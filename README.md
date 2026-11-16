<a id="readme-top"></a>

[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

<br />
<div align="center">
  <a href="https://github.com/aybrkaknc/Logger">
    <img src="icons/ic_launcher.png" alt="Logger" width="80" height="80">
  </a>

  <h3 align="center">Logger</h3>

  <p align="center">
    A small Android logcat recorder with filtering, built on Shizuku.
    <br />
    <a href="README.tr.md"><strong>Türkçe</strong></a>
    &middot;
    <a href="https://github.com/aybrkaknc/Logger/issues/new">Report Bug</a>
    &middot;
    <a href="https://github.com/aybrkaknc/Logger/issues/new">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
      <ul><li><a href="#built-with">Built With</a></li></ul>
    </li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

Logger records the device logcat in a foreground service and lets you filter and export it. It reads logs through Shizuku, so no root is needed.

* Start and stop recording with one button; a notification tells you when recording stops
* Filter by app, by level (error, warning, info) and optionally hide system apps
* Log line format: `[HH:MM:SS] - [LEVEL] - [App]`
* Configurable maximum log size (1-10 GB) and log text size
* Export logs to a folder chosen with the system file picker
* English and Turkish UI

This repository holds the decoded (apktool) source of the app: smali, resources and assets.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [apktool](https://apktool.org/)
* [Shizuku](https://shizuku.rikka.app/)
* Smali / Android resources

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

* Android 10 (API 29) or newer
* [Shizuku](https://shizuku.rikka.app/) installed and running
* Java, [apktool](https://apktool.org/) 3.0.3 and [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer) to build
* `adb` to install

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/aybrkaknc/Logger.git
   cd Logger
   ```
2. Build the APK
   ```sh
   java -jar apktool.jar b . -o rebuilt.apk
   ```
3. Sign it
   ```sh
   java -jar uber.jar --apks rebuilt.apk --allowResign -o signed
   ```
4. Install it
   ```sh
   adb install -r signed/rebuilt-aligned-debugSigned.apk
   ```
5. Open Logger and grant the Shizuku permission

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

1. Start Shizuku.
2. Open Logger and press the record button.
3. Use the filter screen to narrow logs by app or level.
4. Press stop; the notification stays until you dismiss it.
5. Use the export button to save the log to a folder you pick.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

- [x] Filter screen (app, level, system apps)
- [x] Stop notification
- [ ] Open the app when tapping the notification
- [ ] Running cat animation next to the title
- [ ] Clean up unused code (`CatPatrol`, `CatFlip`, old dialog helpers)

See the [open issues](https://github.com/aybrkaknc/Logger/issues) for more.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

No license has been specified yet.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Project Link: [https://github.com/aybrkaknc/Logger](https://github.com/aybrkaknc/Logger)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[issues-shield]: https://img.shields.io/github/issues/aybrkaknc/Logger.svg?style=for-the-badge
[issues-url]: https://github.com/aybrkaknc/Logger/issues
[stars-shield]: https://img.shields.io/github/stars/aybrkaknc/Logger.svg?style=for-the-badge
[stars-url]: https://github.com/aybrkaknc/Logger/stargazers
[forks-shield]: https://img.shields.io/github/forks/aybrkaknc/Logger.svg?style=for-the-badge
[forks-url]: https://github.com/aybrkaknc/Logger/network/members
