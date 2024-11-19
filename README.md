Malika Atha Indurasmi <br />
2306275203 <br />
PBP A <br />
#### Link to Repository: https://github.com/malikaatha/mlikoogh.git


# Tugas Individu

<details>
  <summary><b>Tugas 7: Elemen Dasar Flutter</b></summary>

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless Widget: Widget yang tidak memiliki state. Widget ini dimuat secara statis, seluruh konfigurasi yang diload di dalamnya telah diinisiasikan sejak awal widget dimuat. Widget ini tidak akan berubah karena interaksi pengguna maupun variabel dan nilai lain yang ditemukan.
- Stateful Widget: Widget yang statenya dinamis atau dapat berubah-ubah. Widget ini dapat merespon interaksi pengguna karena interaksi luar dari pengguna maupun tracking penggunaan data.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- MyApp: merupakan stateless widget sebagai base dari keseluruhan aplikasi, untuk mengatur tema aplikasi, judul, dan halaman home saat aplikasi pertama dijalankan.
- MyHomePage: sebuah widget yang bersifat stateless, berfungsi untuk menampilkan keseluruhan home page.
- Card: sebuah stateless widget yang menampung informasi mengenai data pengguna. Memiliki atribut judul dan isi data.
- MaterialApp: widget utama untuk struktur data aplikasi.
- Scaffold: Struktur dasar halaman yang memberikan kerangka dengan AppBar (bagian atas halaman), body (konten utama), dan floatingActionButton supaya tampilan aplikasi lebih teratur.
- AppBar: Widget untuk menampilkan judul aplikasi di bagian atas.
- GridView: Menyusun item dalam bentuk grid dengan kolom yang ditentukan.
- Column: Menyusun widget secara vertikal untuk menempatkan widget teks, tombol, atau widget lain dalam satu kolom.
- Row: Sama seperti column tapi secara horizontal.
- Text: Untuk menampilkan teks di aplikasi, biasanya untuk menampilkan informasi statis seperti judul atau deskripsi.
- Icon: Menampilkan ikon yang digunakan untuk navigasi pada setiap menu.
- SnackBar: Menampilkan notifikasi/pesan yang muncul secara sementara ketika suatu event dilakukan.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Dengan setState(), kita menyatakan bahwa state internal dari sebuah object telah diubah. setState() digunakan untuk memperbarui state sehingga program akan me-render ulang perubahan yang terjadi pada state tersebut.

## Jelaskan perbedaan antara const dengan final.
- Const: nilai dari variabel tersebut harus diketahui pada saat kompilasi dan tidak dapat diubah setelahnya.
- Final: Variabel yang dideklarasikan dengan final dapat diinisialisasi pada waktu eksekusi, tidak harus saat dikompilasi.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Untuk membuat program Flutter baru, saya membuka directory dimana proyek saya ingin dibuat dengan menjalankan perintah.
``` dart
flutter create lemari_lama
cd lemari_lama
```

2. Untuk membuat tiga tombol sederhana dengan ikon dan teks,saya mengimplementasikan code berikut di menu.dart
``` dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart_checkout, Color(0xFFB2DFDB)),
    ItemHomepage("Tambah Produk", Icons.add, Color(0xFFCE93D8)),
    ItemHomepage("Logout", Icons.logout, Color(0xFFBBDEFB)),
  ];
```

3. Untuk mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
- Menambahkan parameter di fungsi `ItemHomePage`
``` dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan parameter warna

  ItemHomepage(this.name, this.icon, this.color); // Modifikasi konstruktor
}
```
- Memperbarui daftar items dengan menambahkan color
``` dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Color(0xFFE5C5C1)), // Warna Pink
    ItemHomepage("Tambah Produk", Icons.add, Color(0xFFEAD0D1)), // Warna Pink
    ItemHomepage("Logout", Icons.logout, Color(0xFFEDD7D6)), // Warna Pink
];
```
- Mengubah parameter warna dalam fungsi `ItemCard`
``` dart
class ItemCard extends StatelessWidget {
    ...
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Gunakan warna dari item
      borderRadius: BorderRadius.circular(12),
    ...
    )
  }
}
```

4. Untuk memunculkan Snackbar dengan tulisan, saya mengimplementasikan code berikut
``` dart
 child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          String message;
          switch (item.name) {
            case "Lihat Daftar Produk":
              message = "Kamu telah menekan tombol Lihat Daftar Produk";
              break;
            case "Tambah Produk":
              message = "Kamu telah menekan tombol Tambah Produk";
              break;
            case "Logout":
              message = "Kamu telah menekan tombol Logout";
              break;
            default:
              message = "Kamu telah menekan tombol ${item.name}";
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
        },
 )
```
</details>

<details>
  <summary><b>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></summary>

## Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
### Apa itu `const`?
`const` adalah keyword di Flutter yang digunakan untuk mendeklarasikan nilai yang diketahui pada waktu kompilasi dan tidak akan berubah selama runtime. 

### Keuntungan Menggunakan `const`
1. **Optimisasi Performa**: Objek `const` hanya dibuat sekali dan digunakan kembali, sehingga mengurangi overhead memori.
2. **Keamanan**: Dengan `const`, dipastikan bahwa nilai tidak akan berubah sehingga dapat mencegah bug yang sulit dilacak.
3. **Konsistensi**: Membuat kode lebih mudah dibaca dan dipahami karena nilai-nilai tetap konsisten di seluruh aplikasi.

### Kapan Menggunakan `const`
- ketika nilai diketahui pada waktu kompilasi
- untuk widget yang tidak berubah untuk meningkatkan performa aplikasi
- di dalam kelas sebagai `static const` untuk mendeklarasikan konstanta kelas

### Kapan Jangan Menggunakan `const`
- jika nilai dihitung pada runtime, seperti `DateTime.now()`.
- untuk nilai yang diambil dari sumber eksternal seperti HTTP response, database, atau file lokal.

## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
### Column
Column adalah widget yang menyusun anak-anaknya secara vertikal (dari atas ke bawah). Column berguna ketika ingin menempatkan widget satu di atas yang lain.
``` dart
home: Scaffold(
  appBar: AppBar(
    title: Text('Contoh Column'),
  ),
  body: Column(
    children: <Widget>[
      Text('Widget 1'),
      Text('Widget 2'),
      Text('Widget 3'),
    ],
  ),
),
```

### Row
Row adalah widget yang menyusun anak-anaknya secara horizontal (dari kiri ke kanan). Row berguna untuk menempatkan widget berdampingan.
```dart
home: Scaffold(
  appBar: AppBar(
    title: Text('Contoh Row'),
  ),
  body: Row(
    children: <Widget>[
      Text('Widget 1'),
      Text('Widget 2'),
      Text('Widget 3'),
    ],
  ),
),
```

### Row vs Column
- **Arah Penyusunan**: Column menyusun widget secara vertikal, sedangkan Row menyusun widget secara horizontal.
- **Penggunaan Ruang**: Column menggunakan ruang secara vertikal, cocok untuk tata letak yang memerlukan lebih banyak ruang ke bawah. Row menggunakan ruang secara horizontal, cocok untuk tata letak yang memerlukan lebih banyak ruang ke samping.
- **Alignment**: Kedua widget ini memiliki properti alignment yang dapat digunakan untuk mengatur posisi anak-anaknya. Misalnya, mainAxisAlignment dan crossAxisAlignment.

###  Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
- **TextFormField**: Untuk input nama produk, deskripsi, dan harga.
- **ElevatedButton**: Untuk tombol simpan yang nantinya akan menyimpan data yang dimasukkan oleh pengguna.
</ br>
Input flutter lain
- **Checkbox**: Elemen input yang bisa digunakan untuk pilihan berbasis centang (on/off).
- **Switch**: Mirip dengan Checkbox, tetapi tampilannya berupa saklar.
- **RadioButton**: Berguna untuk pilihan tunggal di antara beberapa opsi.
- **DropdownButton**: Untuk menampilkan daftar pilihan dalam bentuk dropdown.
- **Slider**: Untuk memilih nilai dalam rentang tertentu.
- **DatePicker**: Untuk memilih tanggal.

##  Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter, kita dapat menetapkan primary color dan secondary color pada file `main.dart`. Saya telah menerapkan theme pada aplikai saya, yaitu sebagai berikut:
```dart
import 'package:flutter/material.dart';
import 'package:mlikoogh/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 236, 103, 46),
          secondary: const Color.fromARGB(255, 196, 48, 48),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
```

##  Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menavigasi sebuah halaman baru, saya mengakses Navigator melalui BuildContext dan memanggil fungsi yang ada, seperti misalnya `push()`, `pop()`, serta `pushReplacement()`.
``` dart
    if (item.name == "Tambah Mood") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MoodEntryFormPage()));
    }
```
``` dart
    onPressed: () {
        Navigator.pop(context);
    },
```
``` dart
    onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
```

</details>


<details>
  <summary><b>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</b></summary>

  # Tugas 9: Pengembangan Aplikasi Flutter dengan Django Backend

## 1. Mengapa perlu membuat model untuk pengambilan atau pengiriman data JSON? Apakah akan terjadi error jika tidak membuat model terlebih dahulu?

Model diperlukan untuk memastikan struktur data yang diterima atau dikirim sesuai dengan format yang diharapkan. Model mempermudah parsing JSON menjadi objek yang dapat digunakan di aplikasi Flutter. Tanpa model, pengelolaan data akan lebih sulit dan rentan terhadap error seperti **`TypeError`** atau **`NullPointerException`** karena aplikasi tidak tahu bagaimana cara membaca data dengan struktur tertentu. Model juga memastikan konsistensi data di seluruh aplikasi.

## 2. Jelaskan fungsi dari library http yang diimplementasikan dalam tugas ini?

Library **http** digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server Django. Fungsi utamanya adalah untuk mengirim request HTTP (GET, POST, dll.) ke server, menerima response dari server (biasanya dalam format JSON), dan memparsing response tersebut agar dapat digunakan di aplikasi. Dalam tugas ini, library **http** digunakan untuk mengambil data item, mengirim data login/registrasi, dan mengelola request lainnya.

## 3. Jelaskan fungsi dari CookieRequest dan alasan instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter

**CookieRequest** digunakan untuk:
- Menyimpan session cookies yang diterima dari server Django setelah login.
- Menyertakan cookies dalam setiap request HTTP untuk autentikasi pengguna.
- Memastikan status login pengguna tetap terjaga di seluruh komponen aplikasi.

Instance **CookieRequest** perlu dibagikan ke seluruh komponen aplikasi untuk memastikan bahwa setiap komponen dapat mengakses data session pengguna yang sama, sehingga autentikasi tetap konsisten dan pengguna tidak perlu login ulang di setiap halaman.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter

1. **Input Data**: Pengguna memasukkan data melalui form di aplikasi Flutter.
2. **Mengirim Data ke Server**: Aplikasi menggunakan request HTTP (POST) untuk mengirim data tersebut ke server Django.
3. **Pemrosesan di Server**: Django menerima data, memprosesnya (misalnya, menyimpan ke database), dan mengirimkan response (biasanya dalam format JSON).
4. **Menerima Response**: Flutter menerima response dari server.
5. **Memparsing Data**: Data JSON diparsing menjadi objek model.
6. **Menampilkan Data**: Data yang diparsing digunakan untuk memperbarui tampilan UI aplikasi Flutter.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout

### Register
1. Pengguna mengisi formulir registrasi di Flutter.
2. Flutter mengirim data melalui request POST ke endpoint registrasi Django.
3. Django memvalidasi dan menyimpan data akun di database.
4. Django mengembalikan response (sukses atau error) ke Flutter.
5. Flutter menampilkan pesan berdasarkan response.

### Login
1. Pengguna memasukkan username dan password di Flutter.
2. Flutter mengirim data melalui request POST ke endpoint login Django.
3. Django memverifikasi kredensial pengguna.
4. Jika sukses, Django mengirimkan session cookie.
5. Flutter menyimpan session cookie menggunakan **CookieRequest**.
6. Flutter mengarahkan pengguna ke halaman utama.

### Logout
1. Pengguna memilih logout di Flutter.
2. Flutter mengirim request ke endpoint logout Django.
3. Django menghapus session di server.
4. Flutter menghapus session cookie dan mengarahkan pengguna ke halaman login.

## 6. Implementasi Checklist secara Step-by-Step

### Registrasi Akun
1. Membuat halaman **RegisterPage** di Flutter dengan form untuk username dan password.
2. Mengirimkan data ke endpoint Django `/auth/register/` menggunakan request POST.
3. Memvalidasi response dari Django dan menampilkan pesan sukses atau error.

### Halaman Login**
1. Membuat halaman **LoginPage** untuk menerima username dan password.
2. Mengintegrasikan login dengan endpoint `/auth/login/` di Django menggunakan **CookieRequest**.
3. Jika login sukses, menyimpan session cookie dan mengarahkan pengguna ke halaman utama.

### Integrasi Sistem Autentikasi
1. Menggunakan **CookieRequest** untuk menyimpan dan mengelola session cookie.
2. Membagikan instance **CookieRequest** ke seluruh komponen aplikasi menggunakan **Provider**.

### Model Kustom
1. Membuat model kustom di Flutter (`ProductEntry`) sesuai dengan struktur JSON dari Django.
2. Model digunakan untuk parsing data yang diterima dari Django.

### Halaman Daftar Item
1. Membuat halaman **ProductEntryPage** untuk menampilkan daftar item dari endpoint `/json/`.
2. Menggunakan **FutureBuilder** untuk mengambil data dari server.
3. Menampilkan nama, harga, dan deskripsi untuk setiap item menggunakan **ListView.builder**.

### Halaman Detail Item
1. Membuat halaman **ProductDetailPage** untuk menampilkan detail item.
2. Menambahkan navigasi ke halaman detail saat item di-klik di daftar.
3. Menampilkan semua atribut item dan tombol kembali ke daftar.

### Filter Item
1. Mengubah endpoint Django untuk hanya mengembalikan item yang terkait dengan pengguna login.
2. Memastikan data yang ditampilkan di Flutter sesuai dengan pengguna login.
</details>
