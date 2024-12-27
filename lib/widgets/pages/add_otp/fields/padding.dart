import 'package:flutter/material.dart';

class selectPadding extends StatefulWidget {
  final TextEditingController controller;
  
	selectPadding({super.key, required this.controller});

  @override
	State<selectPadding> createState() => selectPaddingState();
}

class selectPaddingState extends State<selectPadding> {
  bool isChecked = false;

  Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.selected
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).primaryColor;
      }
      return Theme.of(context).brightness == Brightness.light ? 
        Theme.of(context).primaryColorLight :
        Theme.of(context).primaryColorDark;
  }

  bool get getValue => isChecked;

  @override
	Widget build(BuildContext context) {
    return Flexible(
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        side: const BorderSide(color: Colors.white, width: 0.5),
        title: const Text("Use padding (Unsure? Leave blank)", style: TextStyle(fontSize: 15)),
        checkColor: Colors.white,
        value: isChecked,
        fillColor: WidgetStateProperty.resolveWith(getColor),
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading
      )
    );
  }
}