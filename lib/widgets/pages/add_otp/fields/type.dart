import 'package:flutter/material.dart';

class selectType extends StatefulWidget {
  String? type;
  final TextEditingController controller;

	selectType({super.key, required this.type, required this.controller});

  @override
	State<selectType> createState() => _selectTypeState();
}

class _selectTypeState extends State<selectType> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }


  @override
	Widget build(BuildContext context) {
    
    String parameter = 'Period';
    int initParam = 30;

    if(widget.type != null) {
      switch (widget.type) {
        case 'HOTP':
          parameter = 'Counter';
          initParam = 0;
      }
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget.controller.text = initParam.toString();
    });


    return Flexible(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
            labelText: parameter,
            labelStyle: const TextStyle(fontSize: 13)
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          int? tryNumber;
          if(value != null) tryNumber = int.tryParse(value);
        
          if (tryNumber == null || (tryNumber <= 0 && parameter == 'Period')) {
            return 'Invalid value';
          }
          return null;
        },
      )
    );
  }

}