import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:otp/camera_permission.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class scanQR extends StatefulWidget {
	scanQR({super.key});

  @override
	State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
  String? _barcode = '';

  @override
	Widget build(BuildContext context) {
    final MobileScannerController _controller = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: _controller,
              onDetect: (barcodes) {
                if (mounted) {
                  setState(() {
                    _barcode = barcodes.barcodes[0].rawValue; 
                    _controller.stop();                   
                  });
                }
              },
            )
          ),
          SafeArea(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              onPressed: () {

              },
              child: const Text("Cancel"),
            ),
          )
        ],        
      )
    );

    return ElevatedButton(
      onPressed: () {
        final scanner = MobileScanner(
          controller: _controller,
          onDetect: (barcode) {
            if (barcode.raw == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final code = barcode.barcodes[0].rawValue;
              print(code);
              _controller.stop();
            }
          },
        );
       
        
      },
      child: Text("Scan QR")
    );
  
  }
}

/*
class scanQR extends StatefulWidget {
	const scanQR({super.key});

	@override
	State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
	String? result = '';

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () async {
        bool cameraPermission = await checkPermission(context);

        if(context.mounted && cameraPermission) {
          String? res = await SimpleBarcodeScanner.scanBarcode(
            context,
            barcodeAppBar: const BarcodeAppBar(
              enableBackButton: true,
              backButtonIcon: Icon(Icons.arrow_back_ios),
            ),
            isShowFlashIcon: false,
            scanType: ScanType.qr
          );
          setState(() {
					  result = res;
				  });
        }
			},
			child: const Text('Scan Barcode'),
		);
  }
}*/
