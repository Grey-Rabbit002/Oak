import 'package:flutter/material.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/theme/pallete.dart';

class ServiceData {
  final String title;
  final String imageText;
  final String imagePath;
  final String servicePath;
  final String sub1;
  final String sub2;
  final String sub3;
  final String sub4;
  final String sparkle;

  ServiceData(
      {required this.title,
      required this.imagePath,
      required this.imageText,
      required this.servicePath,
      required this.sparkle,
      required this.sub1,
      required this.sub2,
      required this.sub3,
      required this.sub4});
}

class ServiceCard extends StatelessWidget {
  final ServiceData serviceData;

  const ServiceCard({super.key, required this.serviceData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 310,
        height: 347,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            serviceData.imagePath,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Constants.servIcon1Url,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              serviceData.title,
                              style: TextStyle(
                                  color: Pallete.bgColor, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            reusable(serviceData.sparkle, serviceData.sub1),
                            const SizedBox(
                              height: 5,
                            ),
                            reusable(serviceData.sparkle, serviceData.sub2),
                            const SizedBox(
                              height: 5,
                            ),
                            reusable(serviceData.sparkle, serviceData.sub3),
                            const SizedBox(
                              height: 5,
                            ),
                            reusable(serviceData.sparkle, serviceData.sub4),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Know More",
                        style: TextStyle(color: Pallete.bgColor, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0, // Adjust the top position as needed
                  left: 183, // Adjust the left position as needed
                  width: 119, // Adjust the width as needed
                  height: 30, // Adjust the height as needed
                  child: Container(
                    decoration: BoxDecoration(
                      color: Pallete.bgColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        serviceData.imageText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    // Replace with desired color
                  ),
                ),
              ],
            )));
  }
}

Widget reusable(String img, String text) {
  return Row(
    children: [
      Image(image: AssetImage(img)),
      const SizedBox(
        width: 10,
      ),
      Text(text)
    ],
  );
}
