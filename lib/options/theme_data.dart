import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appOptions = ThemeData(
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.w400
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    backgroundColor: Color(0xFF2C5364)
  ),
); 

void systemUIOptions() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}