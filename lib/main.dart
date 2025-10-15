import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/product_list_page.dart';

void main() {
  runApp(const KahyoApp());
}

class KahyoApp extends StatelessWidget {
  const KahyoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kahyo Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00796B)),
        useMaterial3: true,
      ),
      home: ProductListPage(),
    );
  }
}
