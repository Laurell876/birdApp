import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/vm_login.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = new LoginViewModel();
  bool _progressBarState = false;

  String _validateEmail(String value) {
    RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        multiLine: false);
    if (!regExp.hasMatch(value)) {
      return 'E-mail Address must be a valid email address.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters.';
    }

    return null;
  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(0,100,0,0),
                 child: Row(
                    children: <Widget>[
                        Text("LOGIN",
                        style:TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                        ),
                        Text(".",
                        style:TextStyle(
                          color: UIData.quitoThemeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                        ),
                      ],
                  ),
               ),


              SizedBox(height:10),
              TextFormField(
                validator: (value) {
                  return _validateEmail(value);
                },
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  alignLabelWithHint: true,
                  hintText: 'foo@bar.com',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onSaved: (value) {
                  model.email = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  return _validatePassword(value);
                },
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  focusColor: UIData.quitoThemeColor,
                  alignLabelWithHint: true,
                  hintText: 'foo@bar.com',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onSaved: (value) {
                  model.password = value;
                },
              ),
              
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  child: _progressBarState
                      ? const CircularProgressIndicator()
                      : Text(
                              "Sign in",
                              style: TextStyle(
                                color:Colors.black,
                                fontSize: 18,
                                )
                            ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      toggleProgressBarState();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Provider.of<AuthController>(context, listen: false).login(context, model);
                      } else {}
                      toggleProgressBarState();
                    });
                  },
                ),
              ),
            ],
          )),
    );
  }
}
