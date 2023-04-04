import 'package:flutter/material.dart';

class ParrotGif extends StatelessWidget {
  const ParrotGif({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/parrot.gif',
        fit: BoxFit.contain,
      );
}
