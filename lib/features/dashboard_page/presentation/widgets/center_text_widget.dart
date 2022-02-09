import 'package:flutter/material.dart';

class CenterTextWidget extends StatelessWidget {
  final String title;
  const CenterTextWidget({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
