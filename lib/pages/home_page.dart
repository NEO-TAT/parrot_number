import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget get _parrotGif => Image.asset(
        'assets/parrot.gif',
        fit: BoxFit.contain,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.loose(const Size.square(160)),
                child: _parrotGif,
              ),
              const Text('Parrot Number'),
            ],
          ),
        ),
      ),
    );
  }
}
