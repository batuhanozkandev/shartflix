# 🎬 ShartFlix

ShartFlix, kullanıcıların filmleri kaydırarak keşfedebildiği, favorilerine ekleyebildiği ve sınırlı tekliflerle etkileşim kurabildiği modern bir **Flutter uygulamasıdır**.

---

## 🚀 Özellikler

- 🔐 Email ile giriş & kayıt
- 🖼 Profil fotoğrafı yükleme
- 🎞 Keşfet ekranı (PageView + kaydırma)
- ❤️ Favori filmleri ekle/çıkar (anlık güncellenir)
- 👤 Kişi profili görüntüleme
- 💰 Sınırlı teklif ekranı
- 🔄 Pull to refresh desteği

---

## 🛠 Kullanılan Teknolojiler

| Teknoloji | Açıklama |
|----------|----------|
| **Flutter** | Mobil uygulama framework’ü |
| **Dart** | Programlama dili |
| **BLoC** | State management |
| **HTTP** | HTTP istekleri |
| **Getx** | HTTP istekleri, Routing, Helper |
| **Equatable** | Event/state karşılaştırmaları |
| **Hive** | Token/local veri yönetimi |
| **Custom Widgets** | Özel butonlar, kartlar, app bar bileşenleri |

---

## 🖼 Ekran Görselleri

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/log_in.png" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/sign_up" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/add_profile.png" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/explore_movie.png" width="200"/></td>
  </tr>
  <tr>
    <td align="center">Giriş</td>
    <td align="center">Kayıt</td>
    <td align="center">Profil Fotoğrafı</td>
    <td align="center">Keşfet</td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/profile_detail.png" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/batuhanozkandev/shartflix/main/screenshots/limited_offer.png" width="200"/></td>
  </tr>
  <tr>
    <td align="center">Kullanıcı Profili</td>
    <td align="center">Sınırlı Teklifler</td>
  </tr>
</table>

---

## 📦 Kurulum

```bash
git clone https://github.com/kullaniciadi/shartflix.git
cd shartflix
flutter pub get
flutter run
