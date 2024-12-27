import 'package:flutter/material.dart';
import 'package:otp_app/widgets/sections/appbar.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:otp_app/widgets/pages/icons/icon_set.dart';
import 'package:otp_app/widgets/sections/extendedFab.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  bool showOptions = false;

	@override
	Widget build(BuildContext context) {

		return Scaffold(
      appBar: appBarOptions("Apps"),
			floatingActionButton: const AddExpandableFab(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (expandableFabKey.currentState != null && expandableFabKey.currentState!.isOpen) {
            expandableFabKey.currentState!.toggle();
          }
          
        },
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              title: const Text("Pinterest",style: TextStyle(fontSize: 15.0)),
              subtitle: const Text("046 342", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0)),
              leading: Container(
                width: 50,
                height: 50,
                child: filterIcons('pinterest', SimpleIcons.pinterest)
              )
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              title: const Text("Github",style: TextStyle(fontSize: 15.0)),
              subtitle: const Text("046 342", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0)),
              leading: Container(
                width: 50,
                height: 50,
                child: filterIcons('github', SimpleIcons.github)),
            )
          ],
        )
      )
		);
	}
}


/*
Image.asset('assets/images/haha.png', fit: BoxFit.contain), 
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red
)
*/
