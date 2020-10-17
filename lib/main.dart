
import 'package:actic/pages/homePage.dart';
import 'package:actic/pages/medlemskap.dart';
import 'package:actic/pages/wifi.dart';
import 'package:flutter/material.dart';

// Härifrån appen körs
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Actic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  TabController tabController;
  TickerProvider vsync;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

// Det här är den första build som körs och visar 
// olika tabbar. Bara en av de har funktionalitet och det är den första
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,

        bottom: new TabBar(controller: tabController, tabs: <Tab>[
          new Tab(
            child: Text('QR'),
          ),
          new Tab(
            child: Text('Medlemskap'),
          ),
          new Tab(
            child: Text('Wifi'),
          ),
        ]),
      ), body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new HomePage(),
          new MembershipPage(),
          new WifiPAge(),
        ],
      ),
      
    );
  }
}







