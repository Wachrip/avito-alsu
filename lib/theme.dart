import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      surface: Colors.white,
      background: Colors.grey[100]!,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black87),
    ),
    // Add extension for our custom colors
    extensions: const [
      CustomColors(
        cardBackground: Colors.white,
        cardText: Colors.black87,
        viewAllCardBackground: Colors.grey,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      surface: Colors.grey[850]!,
      background: Colors.grey[900]!,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    extensions: [
      CustomColors(
        cardBackground: Colors.black.withOpacity(0.8),
        cardText: Colors.white,
        viewAllCardBackground: Colors.grey.shade700,
      ),
    ],
  );
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color cardBackground;
  final Color cardText;
  final Color viewAllCardBackground;

  const CustomColors({
    required this.cardBackground,
    required this.cardText,
    required this.viewAllCardBackground,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? cardBackground,
    Color? cardText,
    Color? viewAllCardBackground,
  }) {
    return CustomColors(
      cardBackground: cardBackground ?? this.cardBackground,
      cardText: cardText ?? this.cardText,
      viewAllCardBackground:
          viewAllCardBackground ?? this.viewAllCardBackground,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardText: Color.lerp(cardText, other.cardText, t)!,
      viewAllCardBackground:
          Color.lerp(viewAllCardBackground, other.viewAllCardBackground, t)!,
    );
  }
}
