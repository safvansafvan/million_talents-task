import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Names',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const Text(
                'Subtitle',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const Text(
                'More Details',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
