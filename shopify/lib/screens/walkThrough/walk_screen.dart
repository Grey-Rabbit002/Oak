import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/data/onboard_data.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/screens/Login/login_screen.dart';
import 'package:shopify/screens/home/home_screen.dart';
import 'package:shopify/theme/pallete.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  OnBoardState createState() => OnBoardState();
}

class OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFE8E0EA)),
              ),
              onPressed: () {
                _navigateToLoginScreen(ap);
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Pallete.bgColor),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PageView.builder(
                itemCount: screens.length,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(screens[index].img),
                      Column(
                        children: [
                          Text(
                            screens[index].text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              screens[index].desc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey,
                                  height: 1.2),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                        child: ListView.builder(
                          itemCount: screens.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    width: 25,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Pallete.bgColor
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ]);
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          // print(index);
                          if (index == screens.length - 1) {
                            // await _storeOnboardInfo();
                            _navigateToLoginScreen(ap);
                          }

                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: currentIndex == 2 ? rectangular() : circle(),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  void _navigateToLoginScreen(AuthProvider ap) async {
    if (ap.isSignedIn == true) {
      await ap.getDataFromSP().whenComplete(
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  Widget circle() {
    return CircleAvatar(
      backgroundColor: const Color(0xFFE0D4EC),
      radius: 40,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Pallete.bgColor,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget rectangular() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFE0D4EC)),
      height: 50,
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get Started",
            style: TextStyle(color: Pallete.bgColor),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Pallete.bgColor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
