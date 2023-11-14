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

