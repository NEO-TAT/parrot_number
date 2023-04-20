import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
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
  Widget build(BuildContext context) => OutlinedButton.icon(
        label: Text(text, style: const TextStyle(color: Colors.black)),
        icon: icon,
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(240, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          foregroundColor: Colors.black,
          textStyle: _buttonTextStyle,
          side: const BorderSide(color: Colors.black, width: 2),
        ),
      );
}
