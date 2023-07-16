import 'package:flutter/material.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/models/on_board.dart';

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: Constants.walk1Url,
    text: "Create Your Own Plate",
    desc:
        "Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.",
    button: const Color(0xFF4756DF),
    bg: const Color(0xFF4756DF),
  ),
  OnboardModel(
    img: Constants.walk2Url,
    text: "Exquisite Catering",
    desc:
        "Experience culinary artistry like never before with our innovative and exquisite cuisine creations",
    bg: const Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: Constants.walk3Url,
    text: "Personal Order Executive",
    desc:
        "Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.",
    bg: Colors.white,
    button: const Color(0xFF4756DF),
  ),
];
