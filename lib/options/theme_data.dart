import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_app/options/light_night_theme.dart';

final appOptionsTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF243b55),
  brightness: Brightness.light,
  appBarTheme: bothThemes.appBarTheme,
  floatingActionButtonTheme: bothThemes.floatingActionButton
);

final appOptionsDarkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFF243b55),
  brightness: Brightness.dark,
  appBarTheme: bothThemes.appBarTheme,
  floatingActionButtonTheme: bothThemes.floatingActionButton
);

// Transparent system navigation bar
void systemUIOptions() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent
    ),
  );
}