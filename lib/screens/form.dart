import 'package:flutter/material.dart';

class FormLearn extends StatefulWidget {
  @override
  _FormLearnState createState() => _FormLearnState();
}

class _FormLearnState extends State<FormLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Form'),
      ),
      body: SingleChildScrollView(
          child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 300,
              ),
              Container(
                color: Colors.deepPurple,
                height: 300,
              ),
              Container(
                color: Colors.limeAccent,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}