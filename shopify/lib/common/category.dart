import 'package:flutter/material.dart';

class Category {
  final String image;
  final String title;
  Category({
    required this.title,
    required this.image,
  });
}

class CategoryCard extends StatelessWidget {
  final Category categoryData;

  const CategoryCard({required this.categoryData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 97,
            width: 80,
            child: Image(
              image: AssetImage(
                categoryData.image,
              ),
            ),
          ),
          Text(
            categoryData.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
