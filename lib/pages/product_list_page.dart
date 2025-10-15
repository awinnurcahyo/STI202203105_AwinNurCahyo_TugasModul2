import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Kahyo Coffee",
      price: 35000,
      description: "Kopi pilihan khas Kahyo dengan aroma lembut dan rasa kuat.",
      image: "assets/images/coffee.jpg",
    ),
    Product(
      name: "Kahyo Green Tea",
      price: 25000,
      description: "Teh hijau segar dari perkebunan alami dengan aroma menenangkan.",
      image: "assets/images/tea.jpg",
    ),
    Product(
      name: "Kahyo Cocoa",
      price: 30000,
      description: "Cokelat bubuk premium, manis seimbang, cocok untuk segala usia.",
      image: "assets/images/cocoa.jpg",
    ),
  ];

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: Text(
          "Kahyo Store",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
