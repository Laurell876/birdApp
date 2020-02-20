import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/add_responsibility_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'controllers/responsibility_controller.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
      ChangeNotifierProvider<ActivityController>(create: (_) => ActivityController()),
      ChangeNotifierProvider<ResponsibilityController>(create: (_) => ResponsibilityController()),
      ChangeNotifierProvider<UserController>(create: (_) => UserController()),
    ],
    child: MyApp(), 
  )
);

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
        
          primaryColor: UIData.quitoThemeColor,
          fontFamily: UIData.quickFont,
          primarySwatch: UIData.quitoThemeColor),
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,

      home: FutureBuilder(
        future: Provider.of<AuthController>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            
            return snapshot.data ? HomePage() : LoginPage();
          }else{
            return Container(color: Colors.white);
          }
        }
      ),
      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.addActivityPage: (BuildContext context) => AddActivityPage(),
        UIData.addResponsibilityPage: (BuildContext context) =>
            AddResponsibilityPage(),
        UIData.activityDetails: (BuildContext context) => ActivityDetails(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.responsibilityPage: (BuildContext context) =>
            ResponsibilityPage(),
        UIData.contactPage: (BuildContext context) => ContactPage()
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )),
    );
  }
}
