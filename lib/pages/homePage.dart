import 'dart:async';
import 'dart:ui';

import 'package:actic/httpRequest.dart';
import 'package:actic/jsonResponseModel.dart';
import 'package:actic/pages/qrCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int center;
  int id;
  Future<Qrcode> response;
  TextEditingController selectCenterController = TextEditingController();
  TextEditingController selectIdController = TextEditingController();

  TabController tabController;
  TickerProvider vsync;

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

// Det här är metoden som kör api anrop metod som ligger i klassen som heter
// httpRequest.dart och sedan sparar response i en variable "response"
// setState kollar för input som vi skriver i textFields och tilldelar till variabler
  void _showQrCode() async {
    setState(() {
      center = int.parse(selectCenterController.text);
      id = int.parse(selectIdController.text);
    });
    if (center != null && id != null) {
      setState(() {
        response = qrCodeResponse(center, id);
        Timer(Duration(seconds: 10), () {
          updateQRCode();
        });
      });
    } else {
      //AlertDialog();
    }
  }

  void updateQRCode() {
    if (response != null) {
      setState(() {
        // response = null;
      });
    }
  }
// Här visar jag första vy som tar input. Båda center och id. Sedan kör jag _showQrcode metod 
// från knappen "Show QRCode". Då för jag response from httpRequest klass och med hjälp av FutureBuilder
// jag kollar om jag har response så skikar jag värde som är en sträng till ny vyn som heter QRCodePage 
// Där med hjälp av en färdig bibliotek konvertirar jag strängen till image.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: (response == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        autofocus: true,
                        controller: selectCenterController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[],
                        decoration: InputDecoration(
                          hoverColor: Colors.blueGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          labelText: 'Enter Center',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        autofocus: true,
                        controller: selectIdController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[],
                        decoration: InputDecoration(
                          hoverColor: Colors.blueGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          labelText: 'Enter ID',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                      color: Colors.red[300],
                      onPressed: _showQrCode,
                      child: Text('Show QRCode', style: TextStyle(color: Colors.white),),
                      
                    ),
                    )
                  ],
                )
              : FutureBuilder<Qrcode>(
                  future: response,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RepaintBoundary(
                        // key: _renderObjectKey,
                        child: QRCodePage(
                          qrCode: snapshot.data.qrcodeString,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}
