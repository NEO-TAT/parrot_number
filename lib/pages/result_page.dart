import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:parrot_number/config/colors.dart';
import 'package:parrot_number/widgets/custom_elevated_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.guessCount});

  final int guessCount;

  String get _shareDescription => '''
  I guessed the answer in $guessCount times!
  Play Parrot Number now!
  ''';

  Widget get _title => const Text(
        'Congratulations!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget get _description => Text(
        'You guessed the answer in $guessCount times.',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      );

  LinearGradient get _rainbowBackground => const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(const Size.square(160)),
                  child: const ParrotGif(),
                ),
                Animate(
                  effects: [ScaleEffect(duration: 500.ms)],
                  child: Column(
                    children: [
                      _title,
                      const SizedBox(height: 16),
                      Animate(
                        effects: [ShakeEffect(delay: 750.ms, hz: 4)],
                        child: _description,
                      ),
                    ],
                  ),
                ),
                Animate(
                  effects: [FlipEffect(delay: 1200.ms)],
                  child: CustomElevatedButton(
                    icon: const Icon(Icons.share),
                    text: 'Share Results',
                    onPressed: () => Share.share(_shareDescription),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
