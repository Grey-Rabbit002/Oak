import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/common/carder.dart';
import 'package:shopify/common/category.dart';
import 'package:shopify/common/crafting.dart';
import 'package:shopify/common/menu.dart';
import 'package:shopify/common/search.dart';
import 'package:shopify/common/service.dart';
import 'package:shopify/common/upper_crafting.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/data/card_data.dart';
import 'package:shopify/data/category_data.dart';
import 'package:shopify/data/craft_data.dart';
import 'package:shopify/data/main_course_data.dart';
import 'package:shopify/data/menu_data.dart';
import 'package:shopify/data/service_data.dart';
import 'package:shopify/data/starters_data.dart';
import 'package:shopify/data/work_data.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/theme/pallete.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Dismiss the keyboard when the user taps outside the TextField
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: ListView(
                    children: <Widget>[
                      base(ap),
                      list1(),
                      // list1(),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: SearchBar(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Start Crafting",
                          style: TextStyle(
                              fontSize: 20,
                              color: Pallete.bgColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      upperCraftingCardList(uppercraftingList),

                      menuCardList(menuList),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text("Top Categories",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      categoryCardList(categoryList),
                      const SizedBox(
                        height: 10,
                      ),
                      reuableRow('Starters', 'More Starters'),
                      listgenerator(startersList),
                      reuableRow('Main Course', 'More Main Course'),
                      listgenerator(maincourseList),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text("Services ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                      ),
                      serviceCardList(serviceList),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text("How does it work ?",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse2(workdata[0]['title'], workdata[0]['body'],
                          workdata[0]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse1(workdata[1]['title'], workdata[1]['body'],
                          workdata[1]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse2(workdata[2]['title'], workdata[2]['body'],
                          workdata[2]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse1(workdata[3]['title'], workdata[3]['body'],
                          workdata[3]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse2(workdata[4]['title'], workdata[4]['body'],
                          workdata[4]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      reuse1(workdata[5]['title'], workdata[5]['body'],
                          workdata[5]['image']),
                      const SizedBox(
                        height: 10,
                      ),
                      bottom(),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}

Widget menuCardList(List list) {
  return SizedBox(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return MenuCard(menuData: list[index]);
      },
    ),
  );
}

Widget categoryCardList(List categoryList) {
  return SizedBox(
    height: 130,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryCard(categoryData: categoryList[index]);
      },
    ),
  );
}

Widget serviceCardList(List serviceList) {
  return SizedBox(
    height: 310,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: serviceList.length,
      itemBuilder: (context, index) {
        return ServiceCard(serviceData: serviceList[index]);
      },
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
          padding: const  EdgeInsets.all(16.0),
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

Widget base(AuthProvider ap) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          "Hi, ${ap.userModel.name} !",
          style: TextStyle(
              fontSize: 22,
              color: Pallete.bgColor,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              const Text("Current location",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    size: 16,
                    color: Pallete.bgColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Hyderabad",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
          Column(children: const [
            Image(
              image: AssetImage(Constants.plauUrl),
              width: 24,
              height: 24,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "How it works ?",
              style: TextStyle(fontSize: 12),
            )
          ])
        ]),
      ],
    ),
  );
}

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
