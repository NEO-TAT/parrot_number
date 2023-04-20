import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/button/custom_button_mixin.dart';

class CustomOutlinedButton extends StatelessWidget with CustomButtonMixin {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  final String text;
  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
        label: Text(text, style: const TextStyle(color: Colors.black)),
        icon: icon,
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonTextStyle,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black, width: 2),
        ),
      );
}
