import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Widget cancelQrButton(){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      )
    ),
    onPressed: () {

    },
    child: const Text("Cancel"),
  );
}