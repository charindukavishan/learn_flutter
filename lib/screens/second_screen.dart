import 'package:flutter/material.dart';

class Second extends StatelessWidget {

  Second(String text){
    this.title = text;
  }

  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(this.title)
      ),
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