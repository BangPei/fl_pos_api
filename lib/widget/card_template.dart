import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? content;
  const CardTemplate({this.color, required this.title, this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultCardTitle(title),
            content ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class DefaultCardTitle extends StatelessWidget {
  final String title;

  const DefaultCardTitle(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
