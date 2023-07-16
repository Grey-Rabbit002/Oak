import 'package:flutter/material.dart';
import 'package:shopify/theme/pallete.dart';

class Menu {
  final String title;
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final double min;
  final double price;
  Menu(
      {required this.title,
      required this.image,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.min,
      required this.price});
}

class MenuCard extends StatelessWidget {
  const MenuCard({required this.menuData, super.key});

  final Menu menuData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 170,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 0,
                blurRadius: 5,
                offset:
                    const Offset(-1, 4), // changes the position of the shadow
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 30, top: 25),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuData.title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(menuData.text1),
                      Text(menuData.text2),
                      Text(menuData.text3),
                      Text(menuData.text4),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Text(
                      "Min${menuData.min.toString()}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "Starts at \$ ${menuData.price.toString()}",
                      style: TextStyle(color: Pallete.bgColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 100,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                menuData.image,
              ),
            ),
          ),
        )
      ],
    );
  }
}
