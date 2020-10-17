
import 'dart:ui';

import 'package:flutter/material.dart';

class WifiPAge extends StatefulWidget {
  WifiPAge({Key key}) : super(key: key);

  @override
  _WifiPAgeState createState() => _WifiPAgeState();
}

class _WifiPAgeState extends State<WifiPAge> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
          child: Text('Wifi', style: TextStyle(fontWeight: FontWeight.bold),),
       ),
    );
  }
}