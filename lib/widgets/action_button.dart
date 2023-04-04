import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
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
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(240, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          side: const BorderSide(color: Colors.black, width: 2),
        ),
        icon: icon,
        label: Text(text, style: const TextStyle(color: Colors.black)),
      );
}
