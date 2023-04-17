import 'package:flutter/material.dart';

class ParrotGif extends StatelessWidget {
  const ParrotGif({super.key});

  static const _tag = 'parrot';
  static const _gifPath = 'assets/images/parrot.gif';

  @override
  Widget build(BuildContext context) => Hero(
        tag: _tag,
        child: Image.asset(_gifPath, fit: BoxFit.contain),
      );
}
