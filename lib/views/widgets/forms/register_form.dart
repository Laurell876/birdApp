import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  bool isEmailAvailable = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController originalPassword = new TextEditingController();
  RegisterViewModel model = new RegisterViewModel();
  Validator val = new Validator();
  bool _progressBarState = false;

  String _validateEmail(String value) {
    RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        multiLine: false);
    if (!regExp.hasMatch(value)) {
      return 'E-mail Address must be a valid email address.';
    }
    if(isEmailAvailable){
      return 'E-mail is already taken';
    }
    return null;
  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            Text('Register',
                style: TextStyle(fontSize: 35, color: Colors.white)),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              validator: (value) {
                return val.validateFirstName(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                prefixIcon: Icon(Icons.person),
                labelText: "First Name",
                labelStyle: TextStyle(color: Colors.white),
                alignLabelWithHint: true,
                hintText: 'Earl',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onSaved: (value) {
                model.firstName = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                return val.validateLastName(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.person),
                labelText: "Last Name",
                labelStyle: TextStyle(color: Colors.white),
                alignLabelWithHint: true,
                hintText: 'John',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onSaved: (value) {
                model.lastName = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                return _validateEmail(value);
              },
              controller: emailController,
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
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: originalPassword,
              validator: (value) {
                return val.validatePassword(value);
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                return val.validatePasswordConfirm(originalPassword.text, value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                prefixIcon: Icon(Icons.lock),
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.white),
                focusColor: UIData.quitoThemeColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: _progressBarState
                    ? const CircularProgressIndicator()
                    : Text(
                        "Sign up",
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 18,
                          )
                      ),
                color: Colors.white,
                onPressed: () async {
                  setState(() {
                    toggleProgressBarState();
                  });
                  isEmailAvailable = await Provider.of<UserController>(context, listen: false).validateUserEmail(emailController.text);
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await Provider.of<AuthController>(context, listen: false).register(context, model);
                  }
                  setState(() {
                    toggleProgressBarState();
                  });
                },
              ),
            ),
          ],
        ));
  }
}
