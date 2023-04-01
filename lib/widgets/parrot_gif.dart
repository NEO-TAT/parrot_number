import 'package:flutter/material.dart';

class ParrotGif extends StatelessWidget {
  const ParrotGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/parrot.gif',
        fit: BoxFit.contain,
      );
}
