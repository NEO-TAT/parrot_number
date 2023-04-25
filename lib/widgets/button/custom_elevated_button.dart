import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/button/custom_button_mixin.dart';

class CustomElevatedButton extends StatelessWidget with CustomButtonMixin {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  final String text;
  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        label: Text(text, style: const TextStyle(color: Colors.white)),
        icon: icon,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonTextStyle,
          backgroundColor: Colors.black,
        ),
      );
}
