import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const RowWidget(
      {required this.title,
      required this.value,
      this.color = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Row(
          children: [
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
}
