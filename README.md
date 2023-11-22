# Nama  : Rizvanu Satrio Nugroho
# NPM   : 2206823682
# Kelas : PBP - F
--- 

<details>

<summary>---TUGAS 7---</summary>

# Tugas 7

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

<details>

<summary>---TUGAS 8---</summary>

# Tugas 8

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

- Navigat.push()

  Navigator.push() digunakan untuk menavigasi ke halaman baru tanpa menghilangkan halaman saat ini dari tumpukan navigasi (stack). Hal ini berarti, ketika melakukan navigasi menuju halaman baru menggunakan Navigator.push(), halaman saat ini tetap ada dalam stack. Pengguna dapat kembali ke halaman sebelumnya dengan mekanisme "back" (seperti tombol back di Android atau gesture swipe di iOS).

  Contoh Penggunaan:
  Misalnya, ketika memiliki aplikasi buku di mana pengguna dapat melihat daftar buku. Ketika mereka menekan sebuah buku, dapat ditampilkan detail buku tersebut di halaman baru.
  ~~~
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BookDetailPage(book)),
  );
  ~~~

  Dalam skenario ini, pengguna dapat kembali dari BookDetailPage ke halaman daftar buku sebelumnya.

- Navigator.pushReplacement()

  Navigator.pushReplacement() digunakan untuk menavigasi ke halaman baru dengan menggantikan halaman saat ini dalam stack. Ini berarti halaman saat ini dihapus dari stack dan penggantiannya tidak memungkinkan pengguna untuk kembali ke halaman itu.

  Contoh Penggunaan:
  Anda memiliki aplikasi dengan proses login. Setelah pengguna berhasil masuk, Anda membawa mereka ke halaman beranda dan tidak ingin mereka dapat kembali ke halaman login dengan menekan tombol back.
  ~~~
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
  ~~~

  Dalam kasus ini, ketika pengguna mencapai HomePage, mereka tidak akan bisa kembali ke halaman login karena telah digantikan di stack.

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Column & Row: Column mengatur elemen secara vertikal, sedangkan Row mengatur elemen secara horizontal.
- Container: Wadah untuk mengatur tata letak dan memberi styling pada elemen, misalnya padding, margin, alignment, etc.
- Stack: Digunakan untuk menumpuk widget/elemen satu di atas yang lain.
- GridView: Menampilkan elemen dalam grid yang teratur dengan bentuk tabel.
- ListView: Menampilkan elemen yang dapat di-scroll secara vertikal.
- Expanded & Flexible: Mengontrol bagian dari ruang yang tersedia yang digunakan. Expanded mengisi ruang tersedia, sedangkan Flexible memberikan lebih banyak kontrol atas faktor fleksibilitas.
- Padding: Memberikan padding di sekeliling elemen child.
- Transform: digunakan untuk mengubah ukuran dan posisi elemen child
- Align: Mengatur posisi elemen child sesuai dengan alignment yang ditentukan.
- Wrap: Membuat row atau column dan secara otomatis beralih ke row atau column berikutnya setelah ruang di row atau column saat ini habis.
- Scaffold: Memberikan struktur dasar material design seperti AppBar, Drawer, dan FloatingActionButton.
- ConstrainedBox, SizedBox, & AspectRatio: Mengontrol ukuran atau aspek rasio dari elemen childnya.

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
-  TextFormField untuk 
Nama Produk
~~~
child: TextFormField(
  decoration: InputDecoration(
    hintText: "Nama Produk",
    labelText: "Nama Produk",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
),
~~~
serta validator untuk memastikan bahwa bidang ini tidak kosong, yang penting untuk memastikan bahwa setiap produk memiliki nama untuk identifikasi.


Harga 
~~~
child: TextFormField(
  decoration: InputDecoration(
    hintText: "Harga",
    labelText: "Harga",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _price = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
),
~~~
beserta validator yang memeriksa tidak hanya kekosongan tetapi juga validitas angka, yang penting untuk data harga karena harus berupa angka. 

Deskripsi
~~~
child: TextFormField(
  decoration: InputDecoration(
    hintText: "Deskripsi",
    labelText: "Deskripsi",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      // TODO: Tambahkan variabel yang sesuai
      _description = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Deskripsi tidak boleh kosong!";
    }
    return null;
  },
),
~~~
serta validator untuk memastikan bahwa deskripsi tidak dibiarkan kosong.

Alasan menggunakan TextForm Field :
- Kesesuaian dengan Jenis Data: Setiap TextFormField disesuaikan dengan jenis data yang diharapkan (teks singkat untuk nama, angka untuk harga, dan teks panjang untuk deskripsi).
- Validasi: Penggunaan validator sangat penting untuk memastikan integritas data. Misalnya, menghindari produk tanpa nama atau dengan harga yang bukan angka.
- Pengalaman Pengguna: Menggunakan elemen input ini memberikan pengalaman pengguna yang intuitif dan mudah, karena mereka sudah familiar dengan cara kerja input teks.


## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan clean architecture pada aplikasi Flutter melibatkan organisasi kode menjadi beberapa lapisan yang terpisah, masing-masing dengan tanggung jawab spesifik:

1. Presentation Layer: Mengelola UI dan interaksi pengguna, biasanya melalui widget dan logic UI Flutter.

2. Business Logic Layer (Domain Layer): Berisi logic bisnis aplikasi termasuk entities dan use cases. Independen dari framework dan UI.

3. Data Layer: Bertanggung jawab atas pengelolaan data, termasuk repositori, model data, dan sumber data (API, database lokal).

4. Dependency Injection: Menggunakan teknik seperti provider atau get_it untuk mengurangi ketergantungan langsung antar komponen.

Tujuan utama clean architecture adalah untuk memisahkan concerns, meningkatkan modularitas, dan memudahkan pengujian. Implementasi ini membantu dalam mengelola dependensi, membuat kode lebih mudah dikelola dan diuji.


## 5.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Membuat folder baru pada lib yaitu screens dan widgets untuk mempermudah melakukan metode clean architeture, kemudian membuat file shoplist_form.dart sebagai halaman form untuk menerima input. Pada form tersebut juga terdapat tipe input berupa TextFormField bagi Nama, Harga, dan Deskripsi serta validasi yang dibutuhkan.

~~~
import 'package:flutter/material.dart';
import '../../widgets/left_drawer.dart';
import 'package:mailboxd/models/product.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

List<Product> productList = [];

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // Add product to the global list
      productList.add(Product(
        name: _name,
        price: _price,
        description: _description,
      ));

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Produk berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Harga: $_price'),
                  Text('Deskripsi: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Produk",
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Harga",
                  labelText: "Harga",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    // TODO: Tambahkan variabel yang sesuai
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: _saveProduct,
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
~~~

Membuat drawer lalu menghubungkan opsi tambah item yang berada pada drawer dan halaman utama ke shoplist_form.dart
~~~
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mailboxd/screens/menu.dart';
import '../screens/shoplist_form.dart';
import '../screens/see_film.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Mailboxd',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "The place to keep track on the movies you have watched!",
                  textAlign: TextAlign.center, // Align text to center
                  style: TextStyle(
                    fontSize: 15, // Set font size to 15
                    color: Colors.white, // Set text color to white
                    fontWeight: FontWeight.normal, // Set font weight to normal
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Film'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Lihat Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductListPage(products: productList)),
              );
            },
          ),
        ],
      ),
    );
  }
}
~~~

Menghubungkan "Tambah Item" button pada halaman utama menuju ShopFormPage
~~~
if (item.name == "Tambah Item") {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopFormPage(),
      ));
}
~~~

IMPLEMENTASI BONUS

Membuat model Item dalam Item.dart yang berada pada folder models
~~~
class Item {
  final String name;
  final int price;
  final String description;

  Item({required this.name, required this.price, required this.description});
}
~~~

Membuat file see_film.dart untuk menampilkan semua item yang telah ditambahkan melalui form
~~~
import 'package:flutter/material.dart';
import 'package:mailboxd/models/item.dart';

class ProductListPage extends StatelessWidget {
  final List<Item> products;

  ProductListPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text(
                  'Harga: ${products[index].price}\nDeskripsi: ${products[index].description}'),
            ),
          );
        },
      ),
    );
  }
}
~~~

Membuat tombol pada drawer untuk mengarahkan ke see_film.dart
~~~
ListTile(
  leading: const Icon(Icons.movie),
  title: const Text('Lihat Item'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ProductListPage(products: productList)),
    );
  },
),
~~~

Mengarahkan ke see_film.dart jika menekan tombol "Lihat Produk" pada halaman utama
~~~
if (item.name == "Lihat Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ProductListPage(items: itemList)),
  );
}
~~~

</details>

<details>

<summary>---TUGAS 9---</summary>

# Tugas 9

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ketika seseorang bekerja dengan data JSON, mereka memiliki pilihan untuk langsung memproses data tersebut tanpa membuat model data terlebih dahulu. Pendekatan ini sering dipilih ketika dibutuhkan fleksibilitas dan kecepatan, seperti dalam proyek kecil atau eksplorasi data yang sifatnya sementara. Tanpa model, seseorang bisa langsung mengakses dan memanipulasi data JSON sesuai kebutuhan, namun kekurangannya adalah kurangnya validasi dan struktur yang jelas.

Di sisi lain, membuat model sebelum mengambil data JSON membantu dalam menjaga konsistensi dan validasi data. Ini sangat berguna dalam proyek besar atau aplikasi yang kompleks di mana keamanan dan ketepatan data sangat penting. Dengan model, seseorang bisa mendefinisikan struktur data, aturan, dan validasi yang membantu dalam pemeliharaan dan skalabilitas jangka panjang.

Jadi, pilihan antara menggunakan model atau tidak tergantung pada kebutuhan spesifik proyek yang dihadapi. Menggunakan model lebih baik untuk proyek yang membutuhkan struktur data yang ketat dan validasi, sementara langsung mengambil data JSON tanpa model lebih cocok untuk tugas yang memerlukan fleksibilitas dan kecepatan.

## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Dalam pengembangan aplikasi Flutter, CookieRequest berperan penting dalam mengelola cookies untuk fungsi seperti mengelola session, pengguna, autentikasi, penyimpanan preferensi, dan tracking. Instance perlu dibagikan ke semua komponen di aplikasi flutter agar semua komponen aplikasi menggunakan sesi yang sama untuk berkomunikasi yang bermanfaat untuk memastikan konsistensi data, efisiensi sumber daya, serta keamanan yang lebih baik sehingga memudahkan pengembangan dan pemeliharaan aplikasi. Pendekatan ini juga mendukung konsistensi cookie melintasi siklus hidup berbagai komponen aplikasi, memudahkan debugging, dan menjaga kebijakan keamanan yang konsisten, sesuai dengan kebutuhan spesifik aplikasi dan arsitektur dari backend.

## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

1. Membuat Permintaan HTTP
2. Mem-parse Respons JSON
3. Membuat Model Data (Opsional)
4. Menampilkan Data dalam Widget
5. Pengelolaan State

Proses ini memadukan penggunaan HTTP request, pemrosesan JSON, opsional pembuatan model data, dan pembuatan UI dengan widget Flutter. Dengan memahami setiap langkah ini, Anda dapat efektif dalam memuat dan menampilkan data dari sumber eksternal dalam aplikasi Flutter Anda.

## 4.  Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

1. Input Data Akun di Flutter
2. Pengiriman Data ke Django
3. Proses Autentikasi oleh Django
4. Penerimaan Respons di Flutter dan Tampilan Menu
5. Pengelolaan State dan Navigasi

Proses ini memadukan penggunaan antarmuka pengguna Flutter untuk input data, komunikasi jaringan untuk mengirim dan menerima data dari server Django, dan logika server Django untuk autentikasi. Setelah berhasil, aplikasi Flutter kemudian menanggapi hasil autentikasi dengan menampilkan konten yang sesuai, seperti menu utama. Proses ini menunjukkan integrasi yang khas antara frontend mobile yang dibuat dengan Flutter dan backend yang dibuat dengan Django.

## 5.  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

1. Scaffold: Widget ini menyediakan struktur dasar untuk aplikasi Material Design. Ini termasuk AppBar, body, drawer, floating action button, bottom navigation bar, dan lain-lain. Scaffold digunakan untuk menyusun layout utama halaman.

2. AppBar: Sebuah bar di bagian atas layar yang biasanya menampilkan judul aplikasi dan aksi. AppBar biasanya digunakan di dalam Scaffold dan menyediakan tempat untuk memasang tombol, judul, atau informasi status.

3. Text: Widget ini digunakan untuk menampilkan teks pada layar. Anda dapat menyesuaikan gaya teks, seperti font, ukuran, warna, dan lain-lain melalui property style.

4. ListTile: Widget yang digunakan untuk membuat item dalam list yang biasanya berisi beberapa baris teks serta ikon opsional di awal atau akhir. ListTile sering digunakan dalam ListView atau Drawer.

5. Card: Widget yang mengimplementasikan kartu Material Design. Card biasanya digunakan untuk menyajikan beberapa informasi terkait dalam bentuk yang terorganisir dan juga dapat memiliki elevation (bayangan).

6. Navigator: Digunakan untuk mengelola stack rute/routing dalam aplikasi. Navigator memungkinkan navigasi antar halaman dengan mem-push dan mem-pop rute dari stack.

7. TextStyle: Bukan widget, melainkan sebuah kelas yang mendefinisikan gaya teks. Digunakan untuk menentukan ukuran font, warna, jenis font, dan lain-lain yang diterapkan pada widget Text.

8. SizedBox: Widget yang memiliki ukuran tetap. Biasanya digunakan untuk memberikan jarak antar widget, atau untuk memberi ukuran tertentu pada widget anaknya.

9. Padding: Widget yang digunakan untuk memberikan padding (jarak dalam) pada widget anaknya. Padding dapat digunakan untuk memberikan jarak antara batas widget dengan konten di dalamnya.

10. EdgeInsets: Bukan widget, tetapi sebuah kelas yang digunakan untuk mendefinisikan padding. Digunakan dengan widget Padding atau properti lain yang memerlukan definisi jarak, seperti margin.

11. Column: Widget yang mengatur anak-anaknya secara vertikal. Column dapat memiliki beberapa widget anak dan mengaturnya dalam sumbu vertikal.

## 6.   Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Implementasi pada flutter

1. Membuat screen sebagai tempat login
~~~import 'package:mailboxd/screens/menu.dart';
import 'package:mailboxd/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:mailboxd/screens/register.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response =
                    await request.login("http://localhost:8000/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 12.0),
                ElevatedButton(
                  child: const Text(
                    'Register Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade700),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
~~~

2. Membuat model yang sesuai dengan data JSON di Django
~~~
import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    DateTime dateAdded;


    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    };
}
~~~

3. Membuat halaman untuk menampilkan item yang ada pada website Django 
~~~
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mailboxd/models/item.dart';

import 'package:mailboxd/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_Item = [];
    for (var d in data) {
      if (d != null) {
        list_Item.add(Item.fromJson(d));
      }
    }
    return list_Item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
~~~


4. Membuat halaman detail tiap item
~~~
import 'package:flutter/material.dart';
import 'package:mailboxd/models/item.dart';


class DetailItem extends StatelessWidget {
  final Item item;

  const DetailItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Region: ${item.fields.price}"),
            SizedBox(height: 10),
            Text("Description: ${item.fields.description}"),

          ],
        ),
      ),
    );
  }
}
~~~

### Implementasi pada Django

1. Membuat app baru dengan nama 'authenticate' pada Django proyek sebelumnya dengan melakukan :
~~~
django-admin startapp authenticate
~~~

2. Membuat fungsi 'login' pada views.py dari 'authenticate' :
~~~
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
~~~

3. Menambahkan url dari fungsi login tersebut pada 'urls.py' aplikasi 'authenticate'
~~~
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
~~~

4. Menambahkan beberapa variable baru pada 'settings.py' project
~~~
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
~~~

5. Menambahkan url app 'authenticate' pada 'urls.py' 'GudangGame'
~~~
...
path('auth/', include('authentication.urls')),
...
~~~

6. Menambahkan views baru pada app main untuk handle membuat object model dengan flutter
~~~
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Product.objects.create(
            user = request.user,
            name = data["name"],
            price = int(data["price"]),
            description = data["description"],
            amount = 0
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
~~~

7. Menambahkan function tersebut pada 'urls.py'
~~~
path('create-flutter/', create_product_flutter, name='create_product_flutter'),
~~~

</details>
