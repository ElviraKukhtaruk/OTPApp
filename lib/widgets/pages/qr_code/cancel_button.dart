import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Widget cancelQrButton(MobileScannerController controller, BuildContext context){
  return FloatingActionButton(
    onPressed: () {
      controller.stop();
      controller.dispose();
      Navigator.pop(context);
    },
    foregroundColor: Colors.white,
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0)
    ),
    child: const Icon(Icons.close),
  );
}
