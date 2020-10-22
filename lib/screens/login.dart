import 'package:flutter/material.dart';
import 'package:my_app/screens/profile.dart';
import 'package:my_app/services/httm.service.dart';
import 'package:my_app/utils/status.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Email can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _email = text;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.ac_unit_rounded),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )),
                    obscureText: _obscureText,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'Password can not be empty';
                      }
                      return null;
                    },
                    onSaved: (text) {
                      _password = text;
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: auth.loggedInStatus == Status.Authenticating
                          ? Text('Authenticating')
                          : RaisedButton(
                              child: Text('Save'),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  print(auth.login(_email, _password));
                                  
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return Profile();
                                  }));
                                }
                              },
                            ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
