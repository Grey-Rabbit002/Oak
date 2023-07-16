import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/screens/Orders/order_screen.dart';
import 'package:shopify/screens/home/pages/home_screen_main.dart';
import 'package:shopify/screens/profile/profile_screen.dart';
import 'package:shopify/screens/wishlist/wish_list.dart';
import 'package:shopify/theme/pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final List<Widget> screens = [
    const Home(),
    const Home(),
    const Home(),
    const Home()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();
  @override
  Widget build(BuildContext context) {
    final isWeb = kIsWeb;

    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.textColor,
          onPressed: () {},
          child: CircleAvatar(
            backgroundColor: Pallete.bgColor,
            radius: 25,
            child: const Image(image: AssetImage(Constants.logoUrl)),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isWeb)
                    const SizedBox(
                      width: 60,
                    ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Home();
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color:
                              _currentTab == 0 ? Pallete.bgColor : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: _currentTab == 0
                                  ? Pallete.bgColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  if (isWeb)
                    const SizedBox(
                      width: 160,
                    ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const WishListScreen();
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color:
                              _currentTab == 1 ? Pallete.bgColor : Colors.grey,
                        ),
                        Text(
                          "wishList",
                          style: TextStyle(
                              color: _currentTab == 1
                                  ? Pallete.bgColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isWeb)
                    const SizedBox(
                      width: 60,
                    ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const OrderScreen();
                        _currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dining_outlined,
                          color:
                              _currentTab == 2 ? Pallete.bgColor : Colors.grey,
                        ),
                        Text(
                          "Orders",
                          style: TextStyle(
                              color: _currentTab == 2
                                  ? Pallete.bgColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  if (isWeb)
                    const SizedBox(
                      width: 160,
                    )
                  else
                    const SizedBox(
                      height: 25,
                    ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfileScreen();
                        _currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color:
                              _currentTab == 3 ? Pallete.bgColor : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: _currentTab == 3
                                  ? Pallete.bgColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  if (isWeb)
                    const SizedBox(
                      width: 60,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
