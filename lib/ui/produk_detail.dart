import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  bool _isLoading = false; // Loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kode : ${widget.produk?.kodeProduk ?? 'N/A'}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk?.namaProduk ?? 'N/A'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk?.hargaProduk.toString() ?? '0'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
            if (_isLoading) const CircularProgressIndicator(), // Loading indicator
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
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
        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Yakin ingin menghapus data ini?"),
        actions: [
          // Tombol hapus
          OutlinedButton(
            child: const Text("Ya"),
            onPressed: () {
              _deleteProduk();
            },
          ),
          // Tombol batal
          OutlinedButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _deleteProduk() {
    setState(() {
      _isLoading = true; // Set loading to true
    });

void _deleteProduk() {
  setState(() {
    _isLoading = true; // Set loading to true
  });

  ProdukBloc.deleteProduk(id: int.parse(widget.produk!.id!)).then(
    (value) {
      if (value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ProdukPage(),
        ));
      } else {
        // Jika respons delete tidak sukses
        showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
            description: "Hapus gagal, silahkan coba lagi",
          ),
        );
      }
    },
    onError: (error) {
      // Jika ada error pada request
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Terjadi kesalahan, silakan coba lagi",
        ),
      );
    },
  ).whenComplete(() {
    setState(() {
      _isLoading = false; // Reset loading state
    });
  });
}
  }
}
