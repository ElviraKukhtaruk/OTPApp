
import 'package:flutter/material.dart';

class createChoiseChip extends StatefulWidget {
  final ValueChanged<String?> onValueChanged;

	const createChoiseChip({
    super.key, 
    required this.onValueChanged,
  });

  @override
	State<createChoiseChip> createState() => createChoiseChipState();
}

class createChoiseChipState extends State<createChoiseChip> {
  int _value = 0;
  int defValue = 0;
  List<String> types = ['TOTP', 'HOTP'];

  void _onSelected(int value) {
    setState(() {
      _value = value;
    });
    widget.onValueChanged(types[_value]);
  }

  String get getValue => types[_value];

  @override
	Widget build(BuildContext context) {
    return Row(
      children: List.generate(types.length,
        (int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 5),
            child: ChoiceChip(
              padding: const EdgeInsets.all(8),
              label: Text(types[index]),
              selectedColor: const Color(0xFF243b55),
              selected: _value == index, 
              onSelected: (bool selected) { 
                setState(() {
                  _onSelected(selected ? index : defValue);
                });
              },
              labelStyle: TextStyle(
                color: checkForTheme(context, _value, index),
              ),
              showCheckmark: false,
              avatar: isSelected(context, _value, index)
            )
          );
        },
      ).toList(),
    );
  }
}

Color checkForTheme(BuildContext context, int value, int index) {
  if(value == index && Theme.of(context).brightness == Brightness.light) {
    return Colors.white;
  } else if(value != index && Theme.of(context).brightness == Brightness.light) {
    return Colors.black;
  }
  return Colors.white;
}

Icon? isSelected(BuildContext context, int value, int index) {
  if(value == index) {
    return Icon(
      Icons.check, // Use your preferred icon here
      color: Colors.white, // Change color based on state
    );
  } 
  return null;
}