import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_app/services/User.dart';
import 'package:my_app/services/shared_preferences.dart';
import 'package:my_app/services/student.service.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Auth http = new Auth();
  Future<User> username;
  String id;

  getStudent(id) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // getStudent('5f9054055d34272cf4f60cf7');
  }

  @override
  Widget build(BuildContext context) {
    Future<String> getUserData() =>
        CheckSharedPreferences.getIdSharedPreference();
    // username = http.getStudent(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [
                const Color(0xFF6aa6f8),
                const Color(0xFF1a60be),
              ], // whitish to gray
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 15.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            MaterialButton(
                              splashColor: Colors.white,
                              onPressed: () {},
                              color: Color(0xFF4894e9),
                              textColor: Colors.white,
                              child: Icon(
                                Icons.phone,
                                size: 30,
                              ),
                              padding: EdgeInsets.all(16),
                              shape: CircleBorder(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: FutureBuilder<String>(
                                  future: getUserData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF6f6f6f),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('error');
                                    }
                                    return CircularProgressIndicator();
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              transform:
                                  Matrix4.translationValues(0.0, -15.0, 0.0),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    NetworkImage('assets/img_avatar2.png'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Color(0xFF4894e9),
                              highlightColor: Color(0xFFFFFFFF),
                              textColor: Colors.white,
                              child: Icon(
                                Icons.mail_outline,
                                size: 30,
                              ),
                              padding: EdgeInsets.all(16),
                              shape: CircleBorder(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Text(
                                'Message',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF6f6f6f),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.hardEdge,
        child: Icon(Icons.add),
        onPressed: () {
          Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));

          Navigator.of(context).pushNamed('/second');
        },
        backgroundColor: Colors.blue[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
