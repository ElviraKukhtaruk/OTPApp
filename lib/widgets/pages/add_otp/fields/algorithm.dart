import 'dart:collection';

import 'package:flutter/material.dart';

const List<String> algs = <String>['SHA1', 'SHA256', 'SHA512'];
typedef MenuEntry = DropdownMenuEntry<String>;

class selectAlgoritm extends StatefulWidget {
  final TextEditingController controller;
	selectAlgoritm({super.key, required this.controller});

  @override
	State<selectAlgoritm> createState() => _selectAlgoritmState();
}

class _selectAlgoritmState extends State<selectAlgoritm> {

  @override
	Widget build(BuildContext context) {

    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      algs.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
    );
    String parameter = 'Algorithm';
    String dropdownValue = algs.first;


    return DropdownMenu(
      controller: widget.controller,
      initialSelection: algs.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }

}