import 'package:flutter/material.dart';
import 'package:otp/widgets/pages/qr_code/qr_scanner.dart';
import 'package:otp/widgets/sections/appbar.dart';

class Home extends StatelessWidget {
	const Home({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: appBarOptions("Apps"),
			body: Align(
				alignment: Alignment.center,
				child: ElevatedButton(
          onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const scanQR()),
            );
          },
          child: const Text('Second route')
        )
			),
		);
	}
}
