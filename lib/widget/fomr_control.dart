import 'package:fl_pos_app/utils/textform_decoration.dart';
import 'package:flutter/material.dart';

class FormControl extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final bool? showLabel;
  final bool? showHint;
  final bool? readonly;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const FormControl({
    Key? key,
    this.title,
    this.controller,
    this.showLabel,
    this.showHint,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.readonly,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? "title"),
          TextFormField(
            readOnly: readonly ?? false,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            obscureText: obscureText ?? false,
            controller: controller,
            decoration: TextFormDecoration.box(
              title ?? "title",
              showLabel: showLabel ?? false,
              showHint: showHint ?? false,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
