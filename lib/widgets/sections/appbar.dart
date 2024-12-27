import 'package:flutter/material.dart';

PreferredSizeWidget? appBarOptions(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF141e30),
            Color(0xFF243b55)
          ]
        )          
      ),        
    ),      
  );
}