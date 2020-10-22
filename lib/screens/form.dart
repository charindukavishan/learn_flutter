import 'package:flutter/material.dart';

class FormLearn extends StatefulWidget {
  @override
  _FormLearnState createState() => _FormLearnState();
}

class _FormLearnState extends State<FormLearn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _name;

  Widget _textfiled(){
    return TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.info)                    
                    ),
                  maxLines: 1,
                  validator: (text){
                    if(text.isEmpty){
                      return "name can't be empty";
                    }

                    return null;
                  },
                  onSaved: (text){
                    _name = text;
                  },
                );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Form'),
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _textfiled(),

                SizedBox(height: 100,),
                Container(
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        print(_name);
                      }
                    },
                  )
                )
              ],
            ),
        ),
          ),
      ),
    );
  }
}