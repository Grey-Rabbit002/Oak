import 'package:flutter/material.dart';
import 'package:shopify/common/carder.dart';
import 'package:shopify/common/crafting.dart';
import 'package:shopify/common/upper_crafting.dart';
import 'package:shopify/data/card_data.dart';
import 'package:shopify/theme/pallete.dart';

Widget reuableRow(String title, String body) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Text(
          body,
          style: TextStyle(color: Pallete.bgColor),
        ),
      ],
    ),
  );
}

Widget bottom() {
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Delicious food with",
          style: TextStyle(fontSize: 25),
        ),
        Text(
          "professional service !",
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
  );
}

Widget upperCraftingCardList(List list) {
  return SizedBox(
    height: 180,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return UpperCraftingCard(uppercraftingData: list[index]);
        },
      ),
    ),
  );
}

Widget serviceWidget(List serviceList) {
  return SizedBox(
    height: 190,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: serviceList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: CouponCard(couponData: serviceList[index]),
        );
      },
    ),
  );
}

Widget list1() {
  return SizedBox(
    height: 190,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: couponList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: CouponCard(couponData: couponList[index]),
        );
      },
    ),
  );
}

Widget listgenerator(List list) {
  return SizedBox(
    height: 180,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CraftingCard(craftingData: list[index]);
        },
      ),
    ),
  );
}

Widget reuse2(String title, String body, String image) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Image(image: AssetImage(image)),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Pallete.bgColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(body),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget reuse1(String title, String body, String image) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Pallete.bgColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(body),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Image(image: AssetImage(image))
        ],
      ),
    ),
  );
}