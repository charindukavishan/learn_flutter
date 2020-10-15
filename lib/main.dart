import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage( title: "app bar title"),
      theme: ThemeData(
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({this.title});
  
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int a =0 ;


  void increment(){
    
    setState(() {
      a++;
      print(a);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$a')
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: increment,
    )
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
