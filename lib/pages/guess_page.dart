import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/action_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  static const _maxGuessNumber = 100;
  final Random _random = Random();
  final List<int> _guessHistory = [];
  final TextEditingController _guessController = TextEditingController();
  int _answer = 0;
  int _minGuessLimit = 0;
  int _maxGuessLimit = 0;

  Widget get _messageRow => Row(
        children: [
          const ParrotGif(),
          Expanded(
            child: Text(
              '$_minGuessLimit ~ $_maxGuessLimit',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );

  Widget get _guessTextField => TextField(
        controller: _guessController,
        decoration: InputDecoration(
          hintText: 'Enter a number',
          suffixIcon: IconButton(
            onPressed: _inputNumber,
            icon: const Icon(Icons.send, color: Colors.black),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
      );

  Widget get _guessHistoryListView => Container(
        height: 320,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        child: ListView.builder(
          itemCount: _guessHistory.length,
          itemBuilder: (context, index) => ListTile(title: Text('Guess ${index + 1} : ${_guessHistory[index]}')),
        ),
      );

  @override
  void initState() {
    super.initState();
    _setupGame();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Guess Number'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: _messageRow,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: _guessTextField,
                ),
                const Divider(color: Colors.grey, thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        'Guess History',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _guessHistoryListView,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          text: 'Back',
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ActionButton(
                          text: 'Restart',
                          icon: const Icon(Icons.refresh),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void _setupGame() {
    _answer = _random.nextInt(_maxGuessNumber) + 1;
    _minGuessLimit = 1;
    _maxGuessLimit = 100;
    _guessHistory.clear();

    debugPrint('Answer: $_answer');
  }

  void _inputNumber() {
    final guessNumber = int.tryParse(_guessController.text);
    _guessController.text = '';
    if (guessNumber == null) {
      return;
    }

    if (guessNumber < _minGuessLimit || guessNumber > _maxGuessLimit) {
      return;
    }

    if (guessNumber == _answer) {
      debugPrint('You win!');
      return;
    }

    setState(() {
      _guessHistory.add(guessNumber);
    });
  }
}
