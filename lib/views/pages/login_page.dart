import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/forms/login_form.dart';
import 'package:talawa/views/widgets/forms/register_form.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> with TickerProviderStateMixin {
  final PageController _pageController =
      new PageController(initialPage: 1, viewportFraction: 1.0);
  var _media;

  @override
  void initState() {
    super.initState();
  }






  loginScreenForm() => Center(
        child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0, minWidth: 250.0, minHeight: 300.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 30.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    LoginForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              gotoSignUp();
                            },
                            child: Text(
                              "SIGN UP!",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: UIData.quitoThemeColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );

  registrationScreenForm() => Center(
        child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0, minWidth: 250.0, minHeight: 350.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 30.0),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    RegisterForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              gotoLogin();
                            },
                            child: Text(
                              "SIGN IN!",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: UIData.quitoThemeColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );

  gotoLogin() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  gotoSignUp() {
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  @override
  build(BuildContext context) {

    final controller = AnimationController(
      vsync:this,
      duration: Duration(seconds:2),
    );

    final animation = Tween(
      begin:0.0,
      end:1.0
    ).animate(controller);


    final createController = AnimationController(
      vsync:this,
      duration: Duration(seconds:2),
    );

    final createAnimation = Tween(
      begin:0.0,
      end:1.0
    ).animate(createController);

    final loginController = AnimationController(
      vsync:this,
      duration: Duration(seconds:2),
    );

    final loginAnimation = Tween(
      begin:0.0,
      end:1.0
    ).animate(loginController);


    Future<void>  load() async {
      await controller.forward();
      await createController.forward();
      await loginController.forward();
    }
    load();
      


    
    
    

        mainScreen() => Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            FadeTransition(
              opacity: animation,
              child: Container(
              //padding: EdgeInsets.all(100.0),
              padding:EdgeInsets.symmetric(vertical: 50.0),
              child: Center(child: Image(image: AssetImage(UIData.talawaLogo))),
            ),
              
            ),

            
            
            

            new Container(
              //container with login and sign up button
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),

              child: Column(
                children: <Widget>[

                  FadeTransition(
              opacity: createAnimation,
              child: Container(
              //padding: EdgeInsets.all(100.0),
              child:                   new Container(
              width: _media != null
                  ? _media.size.width
                  : MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 90.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new OutlineButton(
                      borderSide: BorderSide(width:2.0,color:Colors.white ),
                      shape: new RoundedRectangleBorder(
                          
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.purpleAccent,
                      highlightedBorderColor: Colors.white,
                      onPressed: () => gotoSignUp(),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "CREATE AN ACCOUNT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
              
            ),



            FadeTransition(
              opacity: loginAnimation,
              child: Container(
              //padding: EdgeInsets.all(100.0),
              child: new Container(
              width: _media != null
                  ? _media.size.width
                  : MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.white,
                      onPressed: () => gotoLogin(),
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    //color: UIData.quitoThemeColor,
                                    color:Colors.black,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
              
            ),

            





                ],
              ),


              
            ),

            
            




          ],
        ),
      );




    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      
      Container(
        decoration:BoxDecoration(
      image: DecorationImage(
        image:AssetImage(UIData.cloud1),
        fit:BoxFit.cover
      ),
    ),


        child: new PageView(
          controller: _pageController,
          physics: new BouncingScrollPhysics(),
          children: <Widget>[
            loginScreenForm(),
            mainScreen(),
            registrationScreenForm()
          ],
        ),
      )
      );
}
}
