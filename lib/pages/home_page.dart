import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:parrot_number/config/colors.dart';
import 'package:parrot_number/pages/guess_page.dart';
import 'package:parrot_number/widgets/custom_elevated_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget get _title => const Text(
        'Parrot Number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );

  LinearGradient get _rainbowBackground => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: rainbowBackground,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: _rainbowBackground),
          width: double.infinity,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(const Size.square(160)),
                  child: const ParrotGif(),
                ),
                Animate(effects: const [ScaleEffect()], child: _title),
                Animate(
                  effects: [FlipEffect(delay: 500.ms)],
                  child: CustomElevatedButton(
                    text: 'Start Game',
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const GuessPage()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
