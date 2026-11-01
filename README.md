# 🎬 Explore Movies — Interactive Flutter Cinema Showcase

[![Flutter](https://img.shields.io/badge/Flutter-3.9+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Demo Video](https://img.shields.io/badge/Demo_Video-Google_Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/file/d/18ZtPRhV_MxIEO0Z6FK0Zq9b2YYONLDxc/view)
[![Theme](https://img.shields.io/badge/Theme-Modern%20Dark-121212?style=for-the-badge&logo=materialdesign&logoColor=6FFFD9)]()
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)]()

**Explore Movies** adalah aplikasi katalog dan penjelajah film interaktif berbasis **Flutter** yang mengedepankan pengalaman visual imersif dan desain *Dark Theme* modern. Aplikasi ini memadukan dua pendekatan eksplorasi visual terbaik di industri mobile: **Auto-play Carousel Slider** dan **Gesture Card Swiper** (Tinder-style stack), dilengkapi dengan informasi sinopsis lengkap dan penandaan film favorit.

> [!NOTE]
> ### 📺 Video Demonstrasi Aplikasi
> Saksikan interaksi antarmuka dan fitur aplikasi (*Carousel Slider*, *Card Swiper*, *Detail Sheet*, dan *Favorit*) secara langsung:  
> 🔗 **[Tonton Video Demo di Google Drive](https://drive.google.com/file/d/18ZtPRhV_MxIEO0Z6FK0Zq9b2YYONLDxc/view)**

---

## ✨ Fitur Utama (*Key Features*)

- **🎭 Dual-Mode Hero Presentation**:
  - **Carousel View** (`carousel_slider`): Tampilan korsel horizontal otomatis dengan efek *peeking*, pembesaran kartu tengah (*enlarge center page*), dan *dynamic dot indicator*.
  - **Card Swiper View** (`flutter_card_swiper`): Tumpukan kartu film interaktif berbasis gestur usap (*swipe left to skip*, *swipe right to favorite*) dengan stempel visual dinamis dan tombol kontrol aksi (*Undo*, *Skip*, *Favorite*).
- **⚡ Seamless Cross-Fade Switcher**:
  - Beralih antar mode Hero secara instan tanpa *rebuild* kasar menggunakan `AnimatedCrossFade`.
- **🍿 Curated Movie Collections**:
  - Seksi horizontal untuk film **Trending**, **Popular**, dan **Top Rated** beresolusi tinggi bersumber dari *The Movie Database (TMDB)*.
- **📄 Interactive Detail Bottom Sheet**:
  - Ketuk kartu mana saja untuk membuka lembar informasi detail berisi sinopsis lengkap, skor rating, genre, sutradara/studio, dan tombol *Simpan ke Favorit*.
- **❤️ Dynamic Favorite State**:
  - Penambahan/penghapusan favorit dengan respon umpan balik instan melalui *Floating SnackBar*.
- **✨ Clean & Focused Single-Page UI**:
  - Desain antarmuka bersih tanpa gangguan navigasi bawah (*bottom nav*) maupun menu *drawer*, memungkinkan pengguna fokus penuh pada eksplorasi konten film.
- **🛡️ Robust Network Image Loader**:
  - Komponen pemuat gambar pintar dengan *progress indicator* dan *fallback error state* bertema sinema jika terjadi gangguan jaringan.

---

## 🛠️ Teknologi & Paket Dependensi (*Tech Stack*)

| Paket | Versi | Fungsi / Kegunaan |
|---|---|---|
| **[Flutter SDK](https://flutter.dev)** | `^3.9.2` | Core framework multiplatform |
| **[carousel_slider](https://pub.dev/packages/carousel_slider)** | `^5.1.2` | Komponen Carousel Hero horizontal dengan auto-play |
| **[flutter_card_swiper](https://pub.dev/packages/flutter_card_swiper)** | `^7.2.0` | Komponen tumpukan kartu swipe interaktif |
| **[google_fonts](https://pub.dev/packages/google_fonts)** | `^8.1.0` | Tipografi modern menggunakan font *Plus Jakarta Sans* |
| **[cupertino_icons](https://pub.dev/packages/cupertino_icons)** | `^1.0.8` | Koleksi ikon pendukung antarmuka iOS & Material |

---

## 📂 Struktur Direktori Proyek (*Project Architecture*)

Arsitektur kode disusun secara modular dan terpisah:

```
caraousel_tour/
├── lib/
│   ├── data/
│   │   └── destination_data.dart             # Mock data katalog film (Hero, Trending, Popular, Top Rated)
│   ├── models/
│   │   └── destination.dart                  # Entitas model data film (ID, title, rating, poster, sinopsis)
│   ├── screens/
│   │   └── home_screen.dart                  # Layar utama (State, hero switcher, bottom sheet)
│   ├── theme/
│   │   └── app_theme.dart                    # Design system (AppColors, ThemeData Dark Mode)
│   ├── widgets/
│   │   ├── custom_image.dart                 # Network image loader dengan loading & error handler
│   │   ├── custom_top_bar.dart               # Glassmorphic top bar dengan BackdropFilter
│   │   ├── hero_carousel_slider.dart         # Integrasi widget carousel_slider
│   │   ├── hero_card_swiper.dart             # Integrasi widget flutter_card_swiper
│   │   └── horizontal_destination_section.dart # Komponen seksi horizontal film reusable
│   └── main.dart                             # Entry point & System UI Overlay styling
└── test/
    └── widget_test.dart                      # Automated widget test suite
```

---

## 🚀 Memulai Proyek (*Getting Started*)

### 1. Prasyarat
Pastikan komputer Anda telah terinstal:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.9 atau lebih baru)
- Android Studio / VS Code dengan ekstensi Flutter & Dart
- Perangkat fisik Android/iOS atau Emulator/Chrome Browser

### 2. Kloning & Pemasangan Dependensi
Buka terminal pada direktori proyek:

```bash
# 1. Unduh seluruh dependensi paket
flutter pub get

# 2. Periksa kesiapan lingkungan Flutter
flutter doctor
```

### 3. Menjalankan Aplikasi
Jalankan aplikasi di perangkat atau emulator pilihan Anda:

```bash
# Jalankan pada perangkat yang aktif
flutter run

# Atau jalankan di Chrome (Web)
flutter run -d chrome
```

---

## 🧪 Menjalankan Pengujian (*Running Tests*)

Proyek ini telah dilengkapi skenario pengujian otomatis untuk memvalidasi tata letak dan fungsionalitas:

```bash
flutter test
```

Skenario pengujian mencakup:
- Verifikasi keberadaan judul *"Explore Movies"* dan ikon pencarian.
- Validasi bahwa *hamburger menu* dan *bottom navigation* telah ditiadakan sesuai desain single-page.
- Verifikasi pemuatan *Carousel Slider* serta seksi *Trending*, *Popular*, dan *Top Rated*.
- Pengujian interaksi pengalihan mode dari *Carousel* ke *Card Swiper* beserta tombol kontrol aksinya.

---


## 🎨 Palet Warna (*Color Palette*)

Aplikasi menggunakan palet warna bertema bioskop modern (*Deep Cinematic Dark Mode*):
- **Background / Surface:** `#121212` / `#201F1F`
- **Primary Accent (Mint Teal):** `#6FFFD9`
- **Secondary Accent (Warm Gold):** `#FABC4D`
- **Error / Skip Accent (Coral Red):** `#FF6B6B`
- **Text on Surface:** `#E5E2E1` / `#B9CAC3`

---

## 📝 Lisensi
Proyek ini dibuat untuk keperluan edukasi dan portofolio pengembangan aplikasi bergerak. Bebas dimodifikasi dan dikembangkan lebih lanjut.
