import 'package:flutter/material.dart';
import 'package:otp/camera_permission.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:otp/widgets/sections/appbar.dart';
import 'package:otp/widgets/pages/qr_code/cancel_button.dart';

class scanQR extends StatefulWidget {
	const scanQR({super.key});

  @override
	State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
  String? _barcode = '';

  @override
	Widget build(BuildContext context) {

    final MobileScannerController controller = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
    );

    return Scaffold(
      appBar: appBarOptions("QR Scanner"),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: controller,
              onDetect: (barcodes) {
                if (mounted) {
                  setState(() {
                    _barcode = barcodes.barcodes[0].rawValue;
                    controller.stop();                   
                  });
                }
              },
            )
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: cancelQrButton(),
            )
          )
        ],        
      )
    );
  }
}
