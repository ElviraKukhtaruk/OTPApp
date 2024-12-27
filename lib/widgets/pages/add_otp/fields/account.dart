import 'package:flutter/material.dart';

class selectAccount extends StatefulWidget {
  final TextEditingController controller;

	selectAccount({super.key, required this.controller});

  @override
	State<selectAccount> createState() => _selectAccountState();
}

class _selectAccountState extends State<selectAccount> {
  bool _isObscure = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) {
    
    return Flexible(
      child: TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration(
          labelText: 'Account Name',
          labelStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder()
        )
      )
     );
  }

}