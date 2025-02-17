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


  //ensures the animation is only called once
  bool first = true;

  void changeFirst() {
    first=false;
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
                          
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                          style: TextStyle(color: Colors.white),
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


    //this animation length has to be larger becasuse it includes startup time
    var controller = AnimationController(
      vsync:this,
      duration: Duration(milliseconds:2000),
    );

    var animation = Tween(
      begin:0.0,
      end:1.0
    ).animate(controller);

    var helloController = AnimationController(
      vsync:this,
      duration: Duration(milliseconds:500),
    );

    var helloAnimation = Tween(
      begin:0.0,
      end:1.0
    ).animate(helloController);

    var createController = AnimationController(
      vsync:this,
      duration: Duration(milliseconds:500),
    );

    var createAnimation = Tween(
      begin:0.0,
      end:1.0
    ).animate(createController);

    var loginController = AnimationController(
      vsync:this,
      duration: Duration(milliseconds:500),
    );

    var loginAnimation = Tween(
      begin:0.0,
      end:1.0
    ).animate(loginController);

    



    Future<void>  load() async {
      await controller.forward();
      await helloController.forward();
      await createController.forward();
      await loginController.forward();
      changeFirst();
    }

    //checks to see if this is the first time the state is loading
    if(first != true) {
      animation = Tween(
        begin:1.0,
        end:1.0
      ).animate(controller);

      helloAnimation = Tween(
        begin:1.0,
        end:1.0
      ).animate(helloController);

      createAnimation = Tween(
        begin:1.0,
        end:1.0
      ).animate(createController);


      loginAnimation = Tween(
        begin:1.0,
        end:1.0
      ).animate(loginController);

    }
    load();

    
   


      





    
    
    

        mainScreen() => new Column(
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
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: _media != null
                  ? _media.size.width
                  : MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  FadeTransition(
                    opacity: helloAnimation,
                    child: Container(
                    child: Text("HELLO",
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                  ),
                  ),
                    
                  ),


                  FadeTransition(
                    opacity: helloAnimation,
                    child: Container(
                    child: Text("THERE",
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                  ),
                  ),
                    
                  ),
                ],
              ),
              FadeTransition(
                    opacity: helloAnimation,
                    child: Container(
                    child: Text(".",
                  style:TextStyle(
                    color:Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                  ),
                  ),
                    
                  ),
              

                ],
              ),
              
            ),
                  




              FadeTransition(
              opacity: createAnimation,
              child: Container(
              //padding: EdgeInsets.all(100.0),
              child:                   new Container(
              width: _media != null
                  ? _media.size.width
                  : MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20.0, right: 30.0, top: 10.0),
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
                                "Create an account",
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

            SizedBox(height:5),

            FadeTransition(
              opacity: loginAnimation,
              child: Container(
              child: new Container(
              width: _media != null
                  ? _media.size.width
                  : MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
                                "Login",
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
        );




    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
          //has to be scrollable so the screen can adjust when the keyboard is tapped
          Center(
            child: SingleChildScrollView(
                        child: 
                  loginScreenForm(),

            ),
          ),
          

          mainScreen(),

                    //has to be scrollable so the screen can adjust when the keyboard is tapped
          Center(
            child: SingleChildScrollView(
                child:registrationScreenForm()
                
            ),
          ),
            
          ],
        ),
      )
      );
}
}
