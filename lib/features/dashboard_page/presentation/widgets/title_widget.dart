import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Text(title,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
    );
  }
}
