import 'package:flutter/material.dart';

/// Custom Title Widget
class TitleWidget extends StatelessWidget {
  /// Initialise Widget
  const TitleWidget({required this.title, Key? key}) : super(key: key);

  /// display text title
  final String title;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      );
}
