import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardTemplate extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? content;
  final VoidCallback? onPressed;
  // final bool? showAddButton;
  const CardTemplate({
    this.color,
    required this.title,
    this.content,
    Key? key,
    this.onPressed,
    // this.showAddButton,
  }) : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultCardTitle(title),
                ActionAddButton(
                  onPressed: onPressed,
                )
              ],
            ),
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

class ActionAddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? showAddButton;
  const ActionAddButton({Key? key, this.onPressed, this.showAddButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showAddButton ?? false,
      child: Column(
        children: [
          MaterialButton(
            minWidth: 120,
            height: 40,
            onPressed: onPressed,
            color: Colors.indigoAccent[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: const [
                Icon(FontAwesomeIcons.plus, color: Colors.white),
                Text(
                  "Tambah",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
