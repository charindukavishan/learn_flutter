import 'package:flutter/material.dart';
import 'package:my_app/screens/home_page.dart';

class Second extends StatelessWidget {

  Second(String text){
    this.title = text;
  }

  String title;
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
        title : Text(this.title),
        leading: IconButton(
          icon: Icon(Icons.home), 
          onPressed: () {
            Navigator.pop(context, HomePage());
          }),
      );
    return Scaffold(
      appBar: appBar2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome to the second screen')
          ],
        )
      ),
    );
  }
}