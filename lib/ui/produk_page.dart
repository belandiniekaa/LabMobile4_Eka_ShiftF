import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Produk Ebel',
          style: TextStyle(color: Colors.white), // Warna font AppBar
        ),
        backgroundColor: const Color(0xFFF1A7B5), // Warna pink soft untuk AppBar
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(
                Icons.add,
                size: 26.0,
                color: Colors.white, // Warna icon tambah
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukForm()),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFFFF0F5), // Latar belakang drawer
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  'Logout Ebel',
                  style: TextStyle(color: Color(0xFF9B4F80)), // Warna font menu
                ),
                trailing: const Icon(Icons.logout, color: Color(0xFF9B4F80)), // Warna icon logout
                onTap: () async {
                  // Logika logout
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFFFF0F5), // Latar belakang konten
        child: ListView(
          children: [
            ItemProduk(
              produk: Produk(
                id: 1,
                kodeProduk: 'A001',
                namaProduk: 'Kamera Ebel',
                hargaProduk: 5000000,
              ),
            ),
            ItemProduk(
              produk: Produk(
                id: 2,
                kodeProduk: 'A002',
                namaProduk: 'Kulkas Ebel',
                hargaProduk: 2500000,
              ),
            ),
            ItemProduk(
              produk: Produk(
                id: 3,
                kodeProduk: 'A003',
                namaProduk: 'Mesin Cuci Ebel',
                hargaProduk: 2000000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              produk: produk,
            ),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFFFD1DC), // Warna background card
        child: ListTile(
          title: Text(
            produk.namaProduk!,
            style: const TextStyle(color: Color(0xFF9B4F80)), // Warna font nama produk
          ),
          subtitle: Text(
            'Rp. ${produk.hargaProduk}',
            style: const TextStyle(color: Color(0xFF9B4F80)), // Warna font harga produk
          ),
        ),
      ),
    );
  }
}
