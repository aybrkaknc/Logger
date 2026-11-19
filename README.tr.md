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
    Shizuku üzerinde çalışan, filtreleme destekli küçük bir Android logcat kayıt uygulaması.
    <br />
    <a href="README.md"><strong>English</strong></a>
    &middot;
    <a href="https://github.com/aybrkaknc/Logger/issues/new">Hata Bildir</a>
    &middot;
    <a href="https://github.com/aybrkaknc/Logger/issues/new">Özellik İste</a>
  </p>
</div>

<details>
  <summary>İçindekiler</summary>
  <ol>
    <li><a href="#proje-hakkında">Proje Hakkında</a>
      <ul><li><a href="#kullanılan-araçlar">Kullanılan Araçlar</a></li></ul>
    </li>
    <li><a href="#başlarken">Başlarken</a>
      <ul>
        <li><a href="#gereksinimler">Gereksinimler</a></li>
        <li><a href="#kurulum">Kurulum</a></li>
      </ul>
    </li>
    <li><a href="#kullanım">Kullanım</a></li>
    <li><a href="#katkıda-bulunma">Katkıda Bulunma</a></li>
    <li><a href="#lisans">Lisans</a></li>
    <li><a href="#iletişim">İletişim</a></li>
  </ol>
</details>

## Proje Hakkında

Logger, cihazın logcat çıktısını bir ön plan servisinde kaydeder; süzmenizi, kaydetmenizi ve gözden geçirmenizi sağlar. Logları Shizuku üzerinden okur, bu yüzden root gerekmez.

* Kaydı tek düğmeyle ya da bildirimden başlat ve durdur
* Uygulamaya ve seviyeye (hata, uyarı, bilgi) göre süz; istenirse sistem uygulamalarını da dahil et
* Log satırı biçimi: `SS:DD:SS - SEVİYE - Uygulama`; çökme ve ANR için kısa açıklamalar
* Ayarlanabilir en yüksek log boyutu (1-10 GB) ve log yazı boyutu
* Logları seçtiğiniz çıktı klasörüne kaydet; her tampon için ayrı klasör ve tüm tamponlar için all klasörü oluşur, her kayıt ayrı dosya olur
* Ek tamponları (radio, events, security, stats) kaydet; hangi tamponların gösterileceğini filtre ekranından seç
* Kayıt sürerken durdurmadan anlık kayıt al
* Kayıtlı logları uygulama içinde ara, paylaş veya sil
* İngilizce ve Türkçe arayüz

0.2.0 sürümü Kotlin ve Jetpack Compose ile baştan yazıldı. Eski uygulama apktool ile çözülmüş bir smali projesiydi.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

### Kullanılan Araçlar

* [Kotlin](https://kotlinlang.org/)
* [Jetpack Compose](https://developer.android.com/compose)
* [Shizuku](https://shizuku.rikka.app/)

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Başlarken

### Gereksinimler

* Android 10 (API 29) veya üzeri
* [Shizuku](https://shizuku.rikka.app/) kurulu ve çalışır durumda
* Derlemek için JDK 17 veya üzeri ve Android SDK (platform 36)

### Kurulum

1. Depoyu klonlayın
   ```sh
   git clone https://github.com/aybrkaknc/Logger.git
   cd Logger
   ```
2. Debug APK derleyin
   ```sh
   ./gradlew assembleDebug
   ```
3. Kurun
   ```sh
   adb install -r app/build/outputs/apk/debug/app-debug.apk
   ```

İmzalı release derlemesi için `keystore.properties.example` dosyasını `keystore.properties` olarak kopyalayın, kendi keystore yolunuzu ve şifrelerinizi yazın, ardından `./gradlew assembleRelease` çalıştırın. `keystore.properties` git dışında tutulur.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Kullanım

1. Shizuku'yu başlatın.
2. Logger'ı açıp kayıt düğmesine basın, ardından Shizuku iznini verin.
3. Filtre ekranından logları uygulamaya veya seviyeye göre daraltın.
4. Kaydı uygulamadan ya da bildirimden durdurun veya devam ettirin.
5. Ayarlardan ek tamponları seçin, ardından filtre ekranından hangi tamponların gösterileceğini belirleyin.
6. Kayıt sürerken kaydet düğmesiyle o ana kadarki logları çıktı klasörüne kopyalayın.
7. Klasör simgesiyle kayıtlı logları görüntüleyin, arayın, paylaşın veya silin.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Katkıda Bulunma

1. Projeyi fork'layın
2. Özellik dalınızı oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit'leyin
4. Dalı push'layın (`git push origin feature/AmazingFeature`)
5. Pull request açın

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Lisans

GNU Genel Kamu Lisansı v3.0 (GPL-3.0) ile dağıtılır. Ayrıntılar için `LICENSE` dosyasına bakın.

Üçüncü taraf bileşenler kendi lisanslarını korur:
* [Shizuku API](https://github.com/RikkaApps/Shizuku-API), Apache Lisansı 2.0
* JetBrains Mono, SIL Open Font License 1.1 (`app/src/main/assets/licenses/JetBrainsMono-OFL.txt`)
* Pixel Operator Mono

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## İletişim

Proje bağlantısı: [https://github.com/aybrkaknc/Logger](https://github.com/aybrkaknc/Logger)

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

[issues-shield]: https://img.shields.io/github/issues/aybrkaknc/Logger.svg?style=for-the-badge
[issues-url]: https://github.com/aybrkaknc/Logger/issues
[stars-shield]: https://img.shields.io/github/stars/aybrkaknc/Logger.svg?style=for-the-badge
[stars-url]: https://github.com/aybrkaknc/Logger/stargazers
[forks-shield]: https://img.shields.io/github/forks/aybrkaknc/Logger.svg?style=for-the-badge
[forks-url]: https://github.com/aybrkaknc/Logger/network/members
