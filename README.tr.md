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
    <li><a href="#yol-haritası">Yol Haritası</a></li>
    <li><a href="#katkıda-bulunma">Katkıda Bulunma</a></li>
    <li><a href="#lisans">Lisans</a></li>
    <li><a href="#iletişim">İletişim</a></li>
  </ol>
</details>

## Proje Hakkında

Logger, cihazın logcat çıktısını bir ön plan servisinde kaydeder; süzmenizi ve dışa aktarmanızı sağlar. Logları Shizuku üzerinden okur, bu yüzden root gerekmez.

* Tek düğmeyle kaydı başlat ve durdur; kayıt durunca bildirim görünür
* Uygulamaya, seviyeye (hata, uyarı, bilgi) göre süz; istenirse sistem uygulamalarını gizle
* Log satırı biçimi: `[SS:DD:SS] - [SEVİYE] - [Uygulama]`
* Ayarlanabilir en yüksek log boyutu (1-10 GB) ve log yazı boyutu
* Logları sistem dosya seçicisiyle seçilen klasöre dışa aktar
* İngilizce ve Türkçe arayüz

Bu depo uygulamanın apktool ile çözülmüş kaynağını içerir: smali, kaynaklar ve varlıklar.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

### Kullanılan Araçlar

* [apktool](https://apktool.org/)
* [Shizuku](https://shizuku.rikka.app/)
* Smali / Android kaynakları

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Başlarken

### Gereksinimler

* Android 10 (API 29) veya üzeri
* [Shizuku](https://shizuku.rikka.app/) kurulu ve çalışır durumda
* Derlemek için Java, [apktool](https://apktool.org/) 3.0.3 ve [uber-apk-signer](https://github.com/patrickfav/uber-apk-signer)
* Kurulum için `adb`

### Kurulum

1. Depoyu klonlayın
   ```sh
   git clone https://github.com/aybrkaknc/Logger.git
   cd Logger
   ```
2. APK'yı derleyin
   ```sh
   java -jar apktool.jar b . -o rebuilt.apk
   ```
3. İmzalayın
   ```sh
   java -jar uber.jar --apks rebuilt.apk --allowResign -o signed
   ```
4. Kurun
   ```sh
   adb install -r signed/rebuilt-aligned-debugSigned.apk
   ```
5. Logger'ı açın ve Shizuku iznini verin

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Kullanım

1. Shizuku'yu başlatın.
2. Logger'ı açın ve kayıt düğmesine basın.
3. Filtre ekranından logları uygulamaya veya seviyeye göre daraltın.
4. Durdurun; bildirim siz kapatana kadar kalır.
5. Dışa aktar düğmesiyle logu seçtiğiniz klasöre kaydedin.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Yol Haritası

- [x] Filtre ekranı (uygulama, seviye, sistem uygulamaları)
- [x] Durdurma bildirimi
- [ ] Bildirime tıklayınca uygulamayı aç
- [ ] Başlığın yanında koşan kedi animasyonu
- [ ] Kullanılmayan kodu temizle (`CatPatrol`, `CatFlip`, eski dialog yardımcıları)

Daha fazlası için [açık sorunlara](https://github.com/aybrkaknc/Logger/issues) bakın.

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Katkıda Bulunma

1. Projeyi fork'layın
2. Özellik dalınızı oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit'leyin
4. Dalı push'layın (`git push origin feature/AmazingFeature`)
5. Pull request açın

<p align="right">(<a href="#readme-top">başa dön</a>)</p>

## Lisans

Henüz bir lisans belirtilmedi.

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
