import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.guessCount});

  final int guessCount;

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

  Widget get _shareResultsButton => ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(240, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          backgroundColor: Colors.black,
        ),
        icon: const Icon(Icons.share),
        label: const Text('Share Results'),
      );

  LinearGradient get _rainbowBackground => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE91E63),
          Color(0xFF9C27B0),
          Color(0xFF673AB7),
          Color(0xFF3F51B5),
          Color(0xFF2196F3),
          Color(0xFF03A9F4),
          Color(0xFF00BCD4),
          Color(0xFF009688),
          Color(0xFF4CAF50),
          Color(0xFF8BC34A),
          Color(0xFFCDDC39),
          Color(0xFFFFEB3B),
          Color(0xFFFFC107),
          Color(0xFFFF9800),
          Color(0xFFFF5722),
        ],
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
                Column(
                  children: [
                    _title,
                    const SizedBox(height: 12),
                    _description,
                  ],
                ),
                _shareResultsButton,
              ],
            ),
          ),
        ),
      );
}
