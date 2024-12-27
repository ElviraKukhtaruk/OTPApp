import 'package:permission_handler/permission_handler.dart';
import 'package:otp_app/camera/permission_dialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:otp_app/encryption/encryption.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';



Future<void> encryptionInBackground(Uint8List passphrase, Uint8List plaintext, Uint8List aad) async {
  return await compute(secureStorage, {
    'passphrase': passphrase,
    'plaintext': plaintext,
    'aad': aad,
  });
}

void secureStorage(Map<String, dynamic> args) {
  Uint8List passphrase = args['passphrase'];
  Uint8List plaintext = args['plaintext'];
  Uint8List aad = args['aad'];


  final ciphertext = AesGcmPbkdf2.encrypt(passphrase, plaintext, aad);
  print(base64.encode(ciphertext)); // Example: zAY+zkMmRCdMB6FZCluJuF+WS3WwWARSqE9ajroUndPOuu3Zj6qGVSP/vklVOjgia29oJ+RfD8lYFYNQRTv8lJHjHx8vTqwxCcVx9xlfvOFD23k56zg9

  //final decryptedtext = AesGcmPbkdf2.decrypt(passphrase, ciphertext, aad);
  //print(utf8.decode(decryptedtext));
}

bool requestedPermissionGranted = false;

Future<bool> checkPermission(context) async {

  final passphrase = utf8.encode("Some passphrase");
  final plaintext = utf8.encode("The quick brown fox jumps over the lazy dog");
  final aad = utf8.encode("Some additional authenticated data (AAD)");


  encryptionInBackground(passphrase, plaintext, aad);
	
	requestedPermissionGranted = false;
	PermissionStatus status = await Permission.camera.status;

	if(status.isGranted) {
		return true;
	} else if(status.isDenied || status.isPermanentlyDenied) {
		await Permission.camera
		.onGrantedCallback(() async {
   			requestedPermissionGranted = true;
  		})
		.onDeniedCallback(() {
			openSettings(context);
		})
		.onPermanentlyDeniedCallback(() {
			openSettings(context);
		})
		.onRestrictedCallback(() {
			restrictedAccess(context);
		})
		.request();
	}
	return requestedPermissionGranted;
}
