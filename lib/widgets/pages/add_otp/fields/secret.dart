import 'package:flutter/material.dart';

class selectSecret extends StatefulWidget {
  final TextEditingController controller;

	selectSecret({super.key, required this.controller});

  @override
	State<selectSecret> createState() => _selectSecretState();
}

class _selectSecretState extends State<selectSecret> {
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
        obscureText: _isObscure,
        decoration: InputDecoration(
          labelText: 'Secret',
          labelStyle: const TextStyle(fontSize: 13),
          border: const OutlineInputBorder(),
          suffix: IconButton(
            iconSize: 20.0,
            icon: _isObscure ? const Icon(Icons.visibility_off) : 
              const Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        )
      )
    );
  }

}