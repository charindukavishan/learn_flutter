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
      body: ListView(
        children: [
          //Divider(),
          ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),ListTile(
            leading: Icon(Icons.brightness_auto),
            title: Text('Brightness'),
            subtitle:  Text('change brightness'),
            trailing:  Icon(Icons.menu),
            onTap: (){},
          ),
          Divider(),
        ],
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