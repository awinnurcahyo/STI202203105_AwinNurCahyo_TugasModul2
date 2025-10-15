import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
              child: Image.asset(
                product.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      "Rp ${product.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.teal,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
