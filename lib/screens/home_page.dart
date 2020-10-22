import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/screens/profile.dart';
import 'package:my_app/screens/second_screen.dart';
import 'package:my_app/services/User.dart';

class HomePage extends StatefulWidget {
  HomePage({this.currentUser});

  User currentUser;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = List<String>.generate(100, (index) => 'Item $index');
  TextEditingController title = TextEditingController();

    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    // Home(),
    // Notifications(),
    // ProfileSecond(),
    // ProfileFirst(),
        Profile(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
             controller: title,
             decoration: InputDecoration(
               prefixIcon: Icon(
                 Icons.search,
                 color: Colors.white,
                 ),
               suffixIcon: IconButton(
                 icon: Icon(
                   Icons.close,
                   color: Colors.white,                   
                  ),
                  onPressed: (){
                    title.text = '';
                  },
               ),
               border: InputBorder.none,
               filled: true,
               hintText: 'Search something...',
               hintStyle: TextStyle(
                 color: Colors.white
               ),
             ),
             cursorColor: Colors.black,
          )
        ),
        body: Center(
          child: Column(
            children: [
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: TextField(
            //     enabled: true,
            //     obscureText: false,
            //     //controller: title,
            //     onChanged: (text) {
            //       print(text);
            //     },
            //     cursorColor: Colors.black,
            //     maxLength: 10,
            //     decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            //     keyboardType: TextInputType.number,
            //     style: TextStyle(fontSize: 20),
            //    ),
            // ),
            _widgetOptions.elementAt(_selectedIndex),

          ]),
        ),
        // floatingActionButton: FloatingActionButton(
        //   clipBehavior: Clip.hardEdge,
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     // Navigator.of(context).push(MaterialPageRoute(builder: (_){
        //     //   return Second("second page");
        //     // }));

        //     Navigator.of(context).pushNamed('/second');
        //   },
        //   backgroundColor: Colors.blue[400],
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      );
  }
}
