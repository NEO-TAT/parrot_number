import 'package:flutter/material.dart';
import 'package:parrot_number/pages/guess_page.dart';
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
                _title,
                _startGameButton(
                  onButtonPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const GuessPage()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _startGameButton({required VoidCallback onButtonPressed}) => ElevatedButton.icon(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(240, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.black,
        ),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Start Game'),
      );
}
