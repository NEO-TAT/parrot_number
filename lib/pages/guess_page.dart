import 'package:flutter/material.dart';
import 'package:parrot_number/widgets/action_button.dart';
import 'package:parrot_number/widgets/parrot_gif.dart';

class GuessPage extends StatelessWidget {
  const GuessPage({super.key});

  Widget get _messageRow => Row(
        children: const [
          ParrotGif(),
          Expanded(
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

  Widget get _guessHistoryListView => Container(
        height: 320,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      );

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
}
