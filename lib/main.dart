import 'package:flutter/material.dart';
import 'package:parrot_number/pages/home_page.dart';

void main() {
  runApp(const ParrotNumberApp());
}

class ParrotNumberApp extends StatelessWidget {
  const ParrotNumberApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Parrot Number',
        theme: ThemeData(
          fontFamily: 'TATFont',
        ),
        home: const HomePage(),
      );
}
