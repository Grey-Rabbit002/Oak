import 'package:flutter/material.dart';
import 'package:shopify/theme/pallete.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _textEditingController,
        cursorColor: Pallete.bgColor,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Pallete.bgColor,
            ),
            hintText: 'Search food or events',
            contentPadding: const EdgeInsets.only(left: 16, top: 14),
            border: InputBorder.none),
      ),
    );
  }
}
