class Strings {
  static const String appName = 'Parrot Number';

  // Home Page
  static const String startGame = 'Start Game';

  // Guess Page
  static const String guess = 'Guess';
  static const String guessNumber = 'Guess Number';
  static const String guessHistory = 'Guess History';
  static const String guessNumberHint = 'Enter a number';
  static const String winMessage = 'You got it!';
  static const String back = 'Back';
  static const String restart = 'Restart';
  static const String invalidNumberMessage = 'Please enter a valid number';
  static String guessNumberLimitMessage(int min, int max) => 'Please enter a number between $min and $max';

  // Result Page
  static const String congratulations = 'Congratulations!';
  static const String shareResults = 'Share Results';
  static String guessTimes(int guessCount) => 'You guessed the answer in $guessCount times.';
  static String shareDescription(int guessCount) => '''
  I guessed the answer in $guessCount times!
  Play Parrot Number now!
  ''';
}
