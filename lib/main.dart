import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:otp/qr_scanner.dart';
import 'package:otp/mobile_scanner.dart';
import 'package:otp/qr_scanner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
	
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontWeight: FontWeight.w400
        ),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Color(0xFF2C5364)
      ),
    ),
    home: const MyFirstApp(),
  ));
}

class MyFirstApp extends StatelessWidget {
	const MyFirstApp({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(
        title: Text("First route"),
      ),
			body: Align(
				alignment: Alignment.center,
				child: ElevatedButton(
          onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => scanQR()),
            );
          },
          child: const Text('Second route')
        )
			),
		);
	}
}
