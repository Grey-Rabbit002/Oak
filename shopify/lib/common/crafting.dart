import 'package:flutter/material.dart';

class Crafting {
  final String image;
  final String title;
  Crafting({
    required this.title,
    required this.image,
  });
}

class CraftingCard extends StatelessWidget {
  final Crafting craftingData;

  const CraftingCard({required this.craftingData, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          Container(
            height: 107,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(craftingData.image))),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            craftingData.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
