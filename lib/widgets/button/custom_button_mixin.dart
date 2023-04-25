import 'package:flutter/widgets.dart';

mixin CustomButtonMixin on Widget {
  TextStyle get buttonTextStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'TATFont',
      );

  Size get buttonSize => const Size(240, 48);

  OutlinedBorder get buttonShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      );
}
