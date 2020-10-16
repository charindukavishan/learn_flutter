import 'package:flutter/material.dart';
import 'package:my_app/screens/second_screen.dart';


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
      body: Container(
          height: 100,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            //Divider(),
            Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.teal,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.cyanAccent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (_){
          //   return Second("second page");
          // }));

          Navigator.of(context).pushNamed('/second');
        },
    )
  );
  }
}