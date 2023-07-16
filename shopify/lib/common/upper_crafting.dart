import 'package:flutter/material.dart';

class UpperCrafting {
  final String image;
  final String title;
  UpperCrafting({
    required this.title,
    required this.image,
  });
}

class UpperCraftingCard extends StatelessWidget {
  final UpperCrafting uppercraftingData;

  const UpperCraftingCard({required this.uppercraftingData, super.key});

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
            width: 190,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(uppercraftingData.image))),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            uppercraftingData.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
