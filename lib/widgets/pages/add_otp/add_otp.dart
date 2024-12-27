import 'package:flutter/material.dart';
import 'package:otp_app/widgets/sections/appbar.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/choiseChip.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/type.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/algorithm.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/digits.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/padding.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/secret.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/account.dart';
import 'package:otp_app/widgets/pages/add_otp/fields/issuer.dart';

class addOTP extends StatefulWidget {
	const addOTP({super.key});

  @override
	State<addOTP> createState() => _scanQRState();
}

class _scanQRState extends State<addOTP> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<selectPaddingState> _paddingKey = GlobalKey<selectPaddingState>();
  final GlobalKey<createChoiseChipState> _otpTypeKey = GlobalKey<createChoiseChipState>();

  final _algController = TextEditingController();
  final _typeController = TextEditingController();
  final _digitsController = TextEditingController();
  final _paddingController = TextEditingController();
  final _secretController = TextEditingController();
  final _accountController = TextEditingController();
  final _issuerController = TextEditingController();

  String? _selectedType;
  int? type;

  @override
	Widget build(BuildContext context) {

    createChoiseChip choiseChip = createChoiseChip(
      //callFunc: (String value) {
      //  _selectedType = value;
      //},
      key: _otpTypeKey,
      onValueChanged: (String? value) {
        setState(() {
          _selectedType = value;
        });
      },
    );


    return Scaffold(
      appBar: appBarOptions("Add OTP"),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              choiseChip,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectIssuer(controller: _issuerController),

                  const SizedBox(width: 10),

                  selectAccount(controller: _accountController),
                ],
              ),

              const SizedBox(height: 10),

              selectSecret(controller: _secretController),

              selectPadding(key: _paddingKey, controller: _paddingController),

              Row(
                children: [

                  selectAlgoritm(controller: _algController),
                  
                  const SizedBox(width: 10),
                  
                  selectDigits(controller: _digitsController),

                ]
              ),

              const SizedBox(height: 10),

              selectType(controller: _typeController, type: _selectedType),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("-------------");
                      print(_otpTypeKey.currentState?.getValue);
                      print(_issuerController.text);
                      print(_accountController.text);
                      print(_secretController.text);
                      print(_paddingKey.currentState?.getValue);
                      print(_algController.text);
                      print(_digitsController.text);
                      print(_typeController.text);
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ), 
                  child: const Text('Save'),
                )
              )

            ]
          )
        )
      )
    );
  }
}
