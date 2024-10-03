import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk Ebel',
          style: TextStyle(color: Colors.white), // Warna font AppBar
        ),
        backgroundColor: const Color(0xFFF1A7B5), // Warna pink soft untuk AppBar
      ),
      body: Container(
        color: const Color(0xFFFFF0F5), // Latar belakang pink soft
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kode : ${widget.produk!.kodeProduk}",
                style: const TextStyle(fontSize: 20.0, color: Color(0xFF9B4F80)), // Warna font
              ),
              Text(
                "Nama : ${widget.produk!.namaProduk}",
                style: const TextStyle(fontSize: 18.0, color: Color(0xFF9B4F80)), // Warna font
              ),
              Text(
                "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
                style: const TextStyle(fontSize: 18.0, color: Color(0xFF9B4F80)), // Warna font
              ),
              const SizedBox(height: 20), // Spasi
              _tombolHapusEdit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFF1A7B5), // Warna font tombol
            side: const BorderSide(color: Color(0xFFF1A7B5)), // Warna border tombol
          ),
          child: const Text("EDIT EBEL"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk!,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10), // Spasi antara tombol
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFF1A7B5), // Warna font tombol
            side: const BorderSide(color: Color(0xFFF1A7B5)), // Warna border tombol
          ),
          child: const Text("DELETE EBEL"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text(
        "Yakin ingin menghapus data ini?",
        style: TextStyle(color: Color(0xFF9B4F80)), // Warna font dialog
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFF1A7B5), // Warna font tombol
            side: const BorderSide(color: Color(0xFFF1A7B5)), // Warna border tombol
          ),
          child: const Text("Ya, Ebel"),
          onPressed: () {
            // Tambahkan logika untuk menghapus data produk
            Navigator.pop(context);
          },
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFF1A7B5), // Warna font tombol
            side: const BorderSide(color: Color(0xFFF1A7B5)), // Warna border tombol
          ),
          child: const Text("Batal, Ebel"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
