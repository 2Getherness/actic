import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:qr_flutter/qr_flutter.dart';

// Det här är en bit kod som visar QRCode när den är färdig hämtat
// QrImage är en färdig bibliotek som hjälper att konvertera api response som är 
// en sträng till Image
class QRCodePage extends StatelessWidget {
  final String qrCode;

  const QRCodePage
  
  ({@required this.qrCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RepaintBoundary(
        // key: _renderObjectKey,
        child: QrImage(
          data: qrCode,
          version: QrVersions.auto,
          size: 500.0,
        ),
      ),
    );
  }
}
