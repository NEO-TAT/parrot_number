import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/action_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';

const _maxGuessNumber = 100;

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  final Random _random = Random.secure();
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
            onPressed: _onGuessNumberSubmitted,
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
          itemBuilder: (context, index) {
            final reversedIndex = _guessHistory.length - index;
            return ListTile(
              title: Text(
                'Guess $reversedIndex :'
                '${_guessHistory[reversedIndex - 1]}',
              ),
            );
          },
        ),
      );

  @override
  void initState() {
    super.initState();
    _setupNewGame();
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
                          onPressed: _setupNewGame,
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

  void _setupNewGame() {
    setState(() {
      _answer = _random.nextInt(_maxGuessNumber) + 1;
      _minGuessLimit = 1;
      _maxGuessLimit = _maxGuessNumber;
      _guessHistory.clear();
    });
  }

  void _onGuessNumberSubmitted() {
    final guessNumber = int.tryParse(_guessController.text);
    _guessController.clear();

    if (guessNumber == null) {
      // TODO: show message for invalid input
      return;
    }

    if (guessNumber < _minGuessLimit || guessNumber > _maxGuessLimit) {
      // TODO: show message for out of range
      return;
    }

    setState(() {
      if (guessNumber >= _answer) {
        _maxGuessLimit = guessNumber;
      }
      if (guessNumber <= _answer) {
        _minGuessLimit = guessNumber;
      }
      _guessHistory.add(guessNumber);
    });

    // TODO: navigate to result page when input correct answer
  }
}
