import 'package:flutter/material.dart';
import 'package:my_app/services/User.dart';
import 'package:my_app/services/shared_preferences.dart';
import 'package:my_app/services/student.service.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<User> futureAlbum;
  Auth auth = new Auth();

  @override
  void initState() {
    super.initState();
    futureAlbum = auth.getStudent(CheckSharedPreferences.sharedPreferenceIdKey);
    print(CheckSharedPreferences.sharedPreferenceIdKey);
    // print(object)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}