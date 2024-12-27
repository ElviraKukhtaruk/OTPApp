import 'package:flutter/material.dart';
import 'package:otp_app/widgets/pages/home/home.dart';
import 'package:otp_app/widgets/pages/icons/icons.dart';
import 'package:otp_app/options/theme_data.dart';
import 'package:otp_app/widgets/sections/extendedFab.dart';
import 'package:otp_app/widgets/pages/add_otp/add_otp.dart';
import 'package:otp_app/options/theme_data.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: icons.iconsKey,
      debugShowCheckedModeBanner: false,
      theme: appOptionsTheme,
      darkTheme: appOptionsDarkTheme,
      home: const Home(),
    );
  }
}