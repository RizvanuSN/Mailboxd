# Nama  : Rizvanu Satrio Nugroho
# NPM   : 2206823682
# Kelas : PBP - F
--- 

<details>

<summary>---TUGAS 7---</summary>

## 1.  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Perbedaan utama antara stateless dan stateful widget adalah bahwa stateless widget tidak memiliki keadaan internal yang dapat berubah, sementara stateful widget memiliki keadaan internal yang dapat berubah dan merespons perubahan data atau interaksi pengguna. Adapun lebih spesifiknya perbedaan keduanya adalah sebagai berikut :
| Aspek Perbeedaan | Stateless Widget | Stateful widget |
|----------|----------|----------|
| Definisi | Widget yang tidak memiliki keadaan (state) internal yang dapat berubah. | Widget yang memiliki keadaan internal yang dapat berubah selama siklus hidup aplikasi |
| Waktu Penggunaan | Terdapat UI yang tidak perlu mengubah tampilan atau data yang bergantung pada perubahan | Terdapat UI yang perlu menanggapi perubahan data atau interaksi pengguna |
| Contoh Penggunaan | Teks statis, gambar, ikon, dan komponen lain yang tidak perlu mengikuti perubahan data atau keadaan aplikasi. | Formulir, daftar item yang dapat di-scroll, tombol yang dapat diklik, dan banyak komponen interaktif lainnya. |

## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. MaterialApp: Widget yang mendefinisikan aplikasi Flutter.
2. Scaffold: Mengatur struktur dasar tampilan aplikasi, termasuk AppBar dan body.
3. AppBar: Menampilkan bar atas aplikasi dengan judul.
4. SingleChildScrollView: Wrapper yang memungkinkan kontennya dapat discroll.
5. Padding: Widget untuk menambahkan padding ke dalam child widget-nya.
6. Column: Menyusun widget-child secara vertikal.
7. Text: Menampilkan teks pada tampilan.
8. GridView.count: Mengatur tampilan dalam bentuk grid.
9. ShopCard: Stateless widget yang digunakan untuk menampilkan kartu toko.
10. InkWell: Mengubah child widget menjadi responsif terhadap sentuhan.
11. Icon: Menampilkan ikon.
12. Container: Mengelola tata letak untuk icon dan teks pada kartu.
13. SnackBar: Widget yang digunakan untuk menampilkan pesan sementara di bagian bawah layar saat suatu aksi terjadi.

Widget lainnya yang digunakan adalah widget bawaan dari Flutter, seperti Colors, Icons, dan lainnya. Juga terdapat definisi dari kelas ShopItem yang digunakan untuk menyimpan data toko (nama, ikon, warna) dan kelas MyHomePage yang merupakan widget utama dalam aplikasi mailboxd


## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. Melakukan import package yang dibutuhkan pada 'main.dart'
~~~
import 'package:flutter/material.dart';
import 'package:mailboxd/menu.dart';
~~~

2. Membuat class 'MyApp' pada 'main.dart'
~~~
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
~~~

3. Membuat file 'menu.dart' pada '/lib' yang akan menjadi tampilan utama menu dan menambahkan import berupa berikut:
~~~
import 'package:flutter/material.dart';
~~~

4. Membuat class MyHomePage untuk tampilan widget-widget pada menu utama
~~~
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, Colors.teal),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.lightBlue),
    ShopItem("Logout", Icons.logout, Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
        backgroundColor: Colors.indigo, 
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
~~~

5. Membuat class 'ShopItem' dengan atribut nama, icon, dan color (implementasi bonus)
~~~
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
~~~

6. Membuat class 'ShopCard' 
~~~
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
~~~

---
</details>
