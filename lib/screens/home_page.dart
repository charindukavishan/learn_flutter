import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/screens/second_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title});

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = List<String>.generate(100, (index) => 'Item $index');
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = "form";
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                enabled: true,
                obscureText: false,
                controller: title,
                onChanged: (text) {
                  print(text);
                },
                cursorColor: Colors.black,
                maxLength: 10,
                decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
              ),
            ),

          ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (_){
            //   return Second("second page");
            // }));

            Navigator.of(context).pushNamed('/second');
          },
        ));
  }
}
