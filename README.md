# MyCareer - Aplikasi Mencari Pekerjaan

**MyCareer** adalah aplikasi pencarian pekerjaan yang dirancang untuk membantu pengguna mencari pekerjaan secara mudah dan efisien. Aplikasi ini dibangun dengan menggunakan **Clean Architecture** untuk memastikan pemisahan yang jelas antara lapisan-lapisan kode, menjadikan aplikasi lebih mudah untuk dikelola, diuji, dan dikembangkan.

## Teknologi yang Digunakan

- **Dart & Flutter** untuk pengembangan aplikasi mobile.
- **Clean Architecture** untuk pemisahan yang jelas antara kode aplikasi.

## Struktur Proyek

Project ini menggunakan **Clean Architecture** yang memisahkan kode aplikasi menjadi beberapa lapisan berdasarkan tanggung jawab masing-masing. Berikut adalah penjelasan tentang struktur folder dalam proyek ini:

### 1. `lib/src/`
Folder utama yang berisi seluruh kode aplikasi.

#### 2. `lib/src/constants/`
Folder ini berisi semua konstanta yang digunakan di seluruh aplikasi.

- **`enum/`**: Menyimpan enumerasi atau daftar nilai konstan yang digunakan dalam aplikasi.
- **`themes/`**: Berisi tema global seperti pengaturan warna dan font aplikasi.
- **`constants.dart`**: File yang menyimpan konstanta aplikasi seperti URL API dan pengaturan default.

#### 3. `lib/src/core/`
Folder inti yang berfungsi sebagai bagian utama dari **Clean Architecture**. Di sini terdapat berbagai komponen penting yang digunakan di seluruh aplikasi.

- **`application/`**: Berisi logika aplikasi yang menangani interaksi antar lapisan.
- **`data/`**: Menyimpan implementasi repository dan sumber data, seperti pengambilan data dari API atau database lokal.
- **`domain/`**: Menyimpan use cases dan model aplikasi yang mendefinisikan logika bisnis utama.
- **`presentation/splash_screen/`**: Menyimpan tampilan dan UI untuk halaman Splash Screen yang muncul saat aplikasi pertama kali dijalankan.
- **`core.dart`**: Berisi file utama untuk konfigurasi dan pengaturan aplikasi secara keseluruhan.

#### 4. `lib/src/network/`
Folder ini digunakan untuk menangani komunikasi dengan API dan server. Di sini Anda akan menemukan file untuk konfigurasi API client dan service yang digunakan untuk mengambil data dari server.

#### 5. `lib/src/routes/`
Folder ini berisi pengaturan navigasi dan rute aplikasi, menentukan halaman-halaman yang akan ditampilkan berdasarkan interaksi pengguna.

#### 6. `lib/src/shared/`
Folder ini berisi komponen dan kode yang digunakan bersama di berbagai bagian aplikasi, seperti widget, utilitas umum, dan helper functions.

#### 7. `lib/src/widgets/`
Folder ini berisi semua widget yang digunakan untuk membangun tampilan antarmuka pengguna (UI) aplikasi. Di sini terdapat komponen visual seperti tombol, input field, dan layout yang digunakan di seluruh aplikasi.

#### 8. `lib/src/main.dart`
Ini adalah entry point dari aplikasi. File ini berisi kode untuk memulai aplikasi dan mengatur pengaturan awal aplikasi, termasuk konfigurasi routing dan dependency injection.

## Menjalankan Aplikasi

### Prasyarat

- **Flutter** dan **Dart SDK** terinstal di komputer Anda.
- **Android Studio** atau **Visual Studio Code** untuk mengembangkan aplikasi.
- Emulator atau perangkat Android/iOS yang terhubung.

### Langkah-langkah untuk Menjalankan

1. Clone repository ini ke dalam perangkat Anda:
   ```bash
   git clone https://github.com/Team-3-Project-Collaboration/MyCareer-FE.git
