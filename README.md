Malika Atha Indurasmi <br />
2306275203 <br />
PBP A <br />
#### Link to PWS Deployment: 
#### Link to Repository: 


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
```
flutter create lemari_lama
cd lemari_lama
```

2. Untuk membuat tiga tombol sederhana dengan ikon dan teks,saya mengimplementasikan code berikut di menu.dart
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart_checkout, Color(0xFFB2DFDB)),
    ItemHomepage("Tambah Produk", Icons.add, Color(0xFFCE93D8)),
    ItemHomepage("Logout", Icons.logout, Color(0xFFBBDEFB)),
  ];
```

3. Untuk mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
- Menambahkan parameter di fungsi `ItemHomePage`
```
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan parameter warna

  ItemHomepage(this.name, this.icon, this.color); // Modifikasi konstruktor
}
```
- Memperbarui daftar items dengan menambahkan color
```
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Color(0xFFE5C5C1)), // Warna Pink
    ItemHomepage("Tambah Produk", Icons.add, Color(0xFFEAD0D1)), // Warna Pink
    ItemHomepage("Logout", Icons.logout, Color(0xFFEDD7D6)), // Warna Pink
];
```
- Mengubah parameter warna dalam fungsi `ItemCard`
```
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
```
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