import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? content;
  final VoidCallback? onPressed;
  final bool? showAddButton;
  const CardTemplate({
    this.color,
    required this.title,
    this.content,
    Key? key,
    this.onPressed,
    this.showAddButton,
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
            DefaultCardTitle(title, showAddButton: showAddButton),
            content ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class DefaultCardTitle extends StatelessWidget {
  final String title;
  final bool? showAddButton;

  const DefaultCardTitle(this.title, {Key? key, this.showAddButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          ActionAddButton(onPressed: () {}, showAddButton: showAddButton),
        ],
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
      child: MaterialButton(
        minWidth: 120,
        height: 40,
        onPressed: onPressed,
        color: Colors.indigoAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: const [
            Icon(Icons.add, color: Colors.white),
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
    );
  }
}
