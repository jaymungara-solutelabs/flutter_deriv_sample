import 'package:flutter/material.dart';

/// Custom Row Widget
class RowWidget extends StatelessWidget {
  /// Initialise Widget
  const RowWidget(
      {required this.title,
      required this.value,
      this.color = Colors.black,
      Key? key})
      : super(key: key);

  /// display label text
  final String title;

  /// display value text
  final String value;

  /// widget value text color
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 16),
          Expanded(
              child: Text(value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: color))),
        ],
      ));
}
