import 'package:flutter/material.dart';

class selectDigits extends StatefulWidget {
  final TextEditingController controller;

	selectDigits({super.key, required this.controller});

  @override
	State<selectDigits> createState() => _selectDigitsState();
}

class _selectDigitsState extends State<selectDigits> {

  int initValue = 6;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) {

    widget.controller.text = initValue.toString();
    
    return Flexible(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Digits',
          labelStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder()
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          int? tryNumber;
          if(value != null) tryNumber = int.tryParse(value);
        
          if (tryNumber == null || tryNumber <= 0) {
            return 'Invalid value';
          }
          return null;
        }
      )
    );
  }

}