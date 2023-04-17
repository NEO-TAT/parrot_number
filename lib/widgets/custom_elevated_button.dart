import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  final String text;
  final Icon icon;
  final VoidCallback? onPressed;

  static const _buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'TATFont',
  );

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        label: Text(text, style: const TextStyle(color: Colors.white)),
        icon: icon,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(240, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          textStyle: _buttonTextStyle,
          backgroundColor: Colors.black,
        ),
      );
}
