import 'package:flutter/material.dart';
import 'package:my_app/screens/second_screen.dart';


class HomePage extends StatefulWidget {
  HomePage({this.title});
  
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


var items = List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
              child: Column(
                children: [
                  ListTile(
                    title: Text(items[index], textAlign: TextAlign.center,),
                  ),
                ],
              ),
          );
        },        
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