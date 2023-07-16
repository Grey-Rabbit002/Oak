// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/screens/home/home_screen.dart';
import 'package:shopify/screens/walkThrough/walk_screen.dart';

import 'package:shopify/theme/pallete.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final SharedPreferences s = await SharedPreferences.getInstance();
      final isSignedIn = s.getBool("is_signedin") ?? false;
      final ap = Provider.of<AuthProvider>(context, listen: false);
      if (isSignedIn) {
        ap.getDataFromSP().whenComplete(() => {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: animation.drive(
                        Tween(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeInOut)),
                      ),
                      child: child,
                    );
                  },
                ),
              )
            });
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const OnBoard(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInOut)),
                ),
                child: child,
              );
            },
          ),
        );
      }
      // print(isSignedIn);
      // Navigating to the next screen after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.bgColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(Constants.logoUrl),
          Text(
            "Craft My Plate",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Pallete.textColor),
          ),
          Text(
            "You customise, We cater",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Pallete.subColor),
          )
        ])));
  }
}
