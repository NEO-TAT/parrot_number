import 'package:flutter/material.dart';

class ParrotGif extends StatelessWidget {
  const ParrotGif({super.key});

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'parrot',
        child: Image.asset('assets/parrot.gif', fit: BoxFit.contain),
      );
}
