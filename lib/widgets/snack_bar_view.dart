import 'package:flutter/material.dart';

class SnackBarView {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.removeCurrentSnackBar();

    final snackBar = SnackBar(content: Text(message), duration: duration);
    messenger.showSnackBar(snackBar);
  }
}
