<a id="readme-top"></a>

[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

<br />
<div align="center">
  <a href="https://github.com/aybrkaknc/Logger">
    <img src="app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" alt="Logger" width="80" height="80">
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
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

Logger records the device logcat in a foreground service and lets you filter and export it. It reads logs through Shizuku, so no root is needed.

* Start and stop recording with one button or from the notification
* Filter by app and by level (error, warning, info), optionally including system apps
* Log line format: `HH:MM:SS - LEVEL - App`, with short explanations for crashes and ANRs
* Configurable maximum log size (1-10 GB) and log text size
* Export logs to a folder chosen with the system file picker
* English and Turkish UI

Version 0.1.0 is a full rewrite in Kotlin and Jetpack Compose. The old app was an apktool-decoded smali project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [Kotlin](https://kotlinlang.org/)
* [Jetpack Compose](https://developer.android.com/compose)
* [Shizuku](https://shizuku.rikka.app/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

* Android 10 (API 29) or newer
* [Shizuku](https://shizuku.rikka.app/) installed and running
* JDK 17 or newer and the Android SDK (platform 36) to build

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/aybrkaknc/Logger.git
   cd Logger
   ```
2. Build a debug APK
   ```sh
   ./gradlew assembleDebug
   ```
3. Install it
   ```sh
   adb install -r app/build/outputs/apk/debug/app-debug.apk
   ```

For a signed release build, copy `keystore.properties.example` to `keystore.properties`, fill in your own keystore path and passwords, then run `./gradlew assembleRelease`. `keystore.properties` is git-ignored.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

1. Start Shizuku.
2. Open Logger and press the record button, then grant the Shizuku permission.
3. Use the filter screen to narrow logs by app or level.
4. Stop or resume recording from the app or the notification.
5. Use the export button to save the log to a folder you pick.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the GNU General Public License v3.0. See `LICENSE` for more information.

Third-party components keep their own licenses:
* [Shizuku API](https://github.com/RikkaApps/Shizuku-API), Apache License 2.0
* JetBrains Mono, SIL Open Font License 1.1 (`app/src/main/assets/licenses/JetBrainsMono-OFL.txt`)
* Pixel Operator Mono

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
