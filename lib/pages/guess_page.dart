import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parrot_number/config/strings.dart';
import 'package:parrot_number/pages/result_page.dart';
import 'package:parrot_number/widgets/button/custom_outlined_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';
import 'package:parrot_number/widgets/snack_bar_view.dart';

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

  bool get _isAnswerGuessed => _minGuessLimit == _maxGuessLimit;

  String get _messageRowText => _isAnswerGuessed ? Strings.winMessage : '$_minGuessLimit ~ $_maxGuessLimit';

  Widget get _messageRow => Row(
        children: [
          const ParrotGif(),
          Expanded(
            child: Text(
              _messageRowText,
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
        enabled: !_isAnswerGuessed,
        controller: _guessController,
        decoration: InputDecoration(
          hintText: Strings.guessNumberHint,
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
                '${Strings.guess} $reversedIndex : '
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
          title: const Text(Strings.guessNumber),
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
                        Strings.guessHistory,
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
                        child: CustomOutlinedButton(
                          text: Strings.back,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomOutlinedButton(
                          text: Strings.restart,
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
      SnackBarView.show(context: context, message: Strings.invalidNumberMessage);
      return;
    }

    if (guessNumber < _minGuessLimit || guessNumber > _maxGuessLimit) {
      SnackBarView.show(
        context: context,
        message: Strings.guessNumberLimitMessage(_minGuessLimit, _maxGuessLimit),
      );
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

    if (_isAnswerGuessed) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        if (!mounted) {
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ResultPage(guessCount: _guessHistory.length)),
        );
      });
    }
  }
}
