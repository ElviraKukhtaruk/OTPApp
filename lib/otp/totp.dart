import 'dart:async';
import 'dart:convert';
import 'package:otp/otp.dart';
import 'package:string_validator/string_validator.dart';

void totp() {
  Timer.periodic(new Duration(seconds: 1), (timer) {

    String secret = "2FASTEST";

    if(!secret.isBase64) secret = base64.encode(secret as List<int>);

    dynamic code = OTP.generateTOTPCodeString(
      secret, 
      DateTime.now().millisecondsSinceEpoch,
      algorithm: Algorithm.SHA1,
      isGoogle: true
    );

    /*dynamic code = OTP.generateHOTPCodeString(
      secret, 
      0,
      algorithm: Algorithm.SHA1,
      isGoogle: true
    );*/
    print(code);

  });
}