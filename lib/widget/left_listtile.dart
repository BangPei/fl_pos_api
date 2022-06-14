import 'package:flutter/material.dart';

class LeftListTile extends StatelessWidget {
  final String title;
  final bool? visibility;
  final IconData? icon;
  final GestureTapCallback? onTap;

  const LeftListTile({
    Key? key,
    required this.title,
    this.visibility,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility ?? true,
      child: ListTile(
        leading: icon == null
            ? const SizedBox.shrink()
            : Icon(
                icon,
                color: Colors.white60,
                size: 25,
              ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white60),
        ),
        onTap: onTap,
      ),
    );
  }
}
