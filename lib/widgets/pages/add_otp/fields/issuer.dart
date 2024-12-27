import 'package:flutter/material.dart';

class selectIssuer extends StatefulWidget {
  final TextEditingController controller;

	selectIssuer({super.key, required this.controller});

  @override
	State<selectIssuer> createState() => _selectIssuerState();
}

class _selectIssuerState extends State<selectIssuer> {
  bool _isObscure = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) {
    
    return  Flexible(
      child: TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Issuer Name',
          labelStyle: TextStyle(fontSize: 13)
        )
      )
    );
  }

}