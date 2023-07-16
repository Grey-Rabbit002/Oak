import 'package:shopify/common/service.dart';
import 'package:shopify/constants/constants.dart';

final List<ServiceData> serviceList = [
  ServiceData(
      title: 'Signature',
      imagePath: Constants.service1Url,
      imageText: 'Recommended',
      servicePath: Constants.servIcon1Url,
      sparkle: Constants.sparkleUrl,
      sub1: 'High Quality Disposable Cutlery',
      sub2: 'Elegant Decorations & Table Settings',
      sub3: 'Served by Waitstaff',
      sub4: 'Best for Weddings, Corporate Events etc'),
  ServiceData(
      title: 'Exotic',
      imagePath: Constants.service1Url,
      imageText: 'Choices',
      servicePath: Constants.servIcon2Url,
      sparkle: Constants.sparkleUrl,
      sub1: 'Continental cuisines ',
      sub2: 'From all around the globe',
      sub3: 'Served by MasterChef',
      sub4: 'Best for Weddings, Corporate Events etc')
];
