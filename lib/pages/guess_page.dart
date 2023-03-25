import 'package:flutter/material.dart';

class GuessPage extends StatelessWidget {
  const GuessPage({super.key});

  Widget get _parrotGif => Image.asset(
        'assets/parrot.gif',
        fit: BoxFit.contain,
      );

  Widget get _messageRow => Row(
        children: [
          _parrotGif,
          const Expanded(
            child: Text(
              '1 ~ 100',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );

  Widget get _guessTextField => TextField(
        decoration: InputDecoration(
          hintText: 'Enter a number',
          suffixIcon: IconButton(
            onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Number'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
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
          ],
        ),
      ),
    );
  }
}
