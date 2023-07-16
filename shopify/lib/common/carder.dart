import 'package:flutter/material.dart';
import 'package:shopify/theme/pallete.dart';

class CouponData {
  final String text;
  final String couponCode;
  final String imagePath;

  CouponData(
      {required this.text, required this.couponCode, required this.imagePath});
}

class CouponCard extends StatelessWidget {
  final CouponData couponData;

  const CouponCard({super.key, required this.couponData});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  couponData.imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: SizedBox(
                width: 150,
                child: Text(
                  couponData.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    couponData.couponCode,
                    style: TextStyle(
                      color: Pallete.textColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        ));
  }
}
