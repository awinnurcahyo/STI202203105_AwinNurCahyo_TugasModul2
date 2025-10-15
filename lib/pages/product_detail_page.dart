import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final TextEditingController _controller = TextEditingController();
  String? savedNote;

  void _saveNote() {
    setState(() {
      savedNote = _controller.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Catatan berhasil disimpan!"),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: Text(
          widget.product.name,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(widget.product.image),
            ),
            const SizedBox(height: 20),
            Text(widget.product.name,
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("Rp ${widget.product.price.toStringAsFixed(0)}",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal)),
            const SizedBox(height: 15),
            Text(widget.product.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87)),
            const SizedBox(height: 25),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Tambahkan Catatan",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.save),
                label: const Text("Simpan Catatan"),
              ),
            ),
            if (savedNote != null) ...[
              const SizedBox(height: 20),
              Text(
                "Catatan Anda:",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(savedNote!,
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: Colors.black87)),
            ],
          ],
        ),
      ),
    );
  }
}
