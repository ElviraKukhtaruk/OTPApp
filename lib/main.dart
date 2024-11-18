import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/widgets/pages/home/home.dart';
import 'package:otp/options/theme_data.dart';

void main() {
  systemUIOptions();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appOptions,
    home: const Home(),
  ));
}