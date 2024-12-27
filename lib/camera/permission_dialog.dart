import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


void openSettings(BuildContext context) {

  Widget cancelButton = TextButton(
    child: const Text("Close"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Settings"),
    onPressed:  () {
      openAppSettings();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Camera permission"),
    content: const Text("Allow access to the camera in the device settings"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void restrictedAccess(BuildContext context) {

  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Camera permission"),
    content: const Text("Permission denial: can't use the camera."),
    actions: [
      okButton
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}