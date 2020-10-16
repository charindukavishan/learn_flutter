import 'package:flutter/material.dart';
import 'package:my_app/screens/second_screen.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_page.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: HomePage( title: "app bar title"),
      theme: ThemeData(
      ),
      routes: <String, WidgetBuilder>{
        '/second': (context) => Second("Second page")
      },
    );
  }
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          flexibleSpace: Image.asset(
            "assets/ayruwada.png",
            fit: BoxFit.cover,
          ),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.directions_car)),
          //     Tab(icon: Icon(Icons.directions_transit)),
          //     Tab(icon: Icon(Icons.directions_bike)),
          //   ],
          // ),
        ),
        // body: TabBarView(
        //     children: [
        //       Container(
        //         width: 200.0,
        //         child: Text("Body",style: TextStyle(fontSize: 20.0),),
        //         color: Colors.lightBlueAccent,
        //       ),
        //       Icon(Icons.directions_transit),
        //       Icon(Icons.directions_bike),
        //     ],
        //   ),
        body: Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(20.0),
          // transform: Matrix4.rotationZ(0.5),
          // alignment: Alignment.center,
          width: double.infinity,
          child: Text('Body'),
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
