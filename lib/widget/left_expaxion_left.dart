import 'package:flutter/material.dart';

class LeftExpantionTile extends StatefulWidget {
  final String title;
  final IconData? icon;
  final List<Widget>? children;
  final bool? initialExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  const LeftExpantionTile(
      {Key? key,
      required this.title,
      this.icon,
      this.children,
      this.initialExpanded,
      this.onExpansionChanged})
      : super(key: key);

  @override
  State<LeftExpantionTile> createState() => _LeftExpantionTileState();
}

class _LeftExpantionTileState extends State<LeftExpantionTile> {
  IconData iconData = Icons.arrow_right;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget.initialExpanded ?? false,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white60),
      ),
      leading: Icon(
        widget.icon ?? Icons.card_travel,
        size: 25,
        color: Colors.white60,
      ),
      trailing: (widget.children ?? []).isEmpty
          ? const SizedBox.shrink()
          : Icon(
              iconData,
              color: Colors.white,
            ),
      backgroundColor: Colors.black87,
      onExpansionChanged: widget.onExpansionChanged ??
          (data) {
            iconData = data ? Icons.arrow_drop_down : Icons.arrow_right;
            setState(() {});
          },
      children: widget.children ?? const [],
    );
  }
}
