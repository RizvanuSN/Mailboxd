import 'package:flutter/material.dart';
import 'package:mailboxd/models/item.dart';

class ProductListPage extends StatelessWidget {
  final List<Item> items;

  ProductListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text(
                  'Harga: ${items[index].price}\nDeskripsi: ${items[index].description}'),
            ),
          );
        },
      ),
    );
  }
}
