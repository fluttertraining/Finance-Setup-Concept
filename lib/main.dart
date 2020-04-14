import 'package:finance_manager/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:finance_manager/screens/setup.dart';
import 'package:finance_manager/widgets/background_stack.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 67, 67, 1),
        accentColor: Color.fromRGBO(248, 249, 211, 1),
        fontFamily: "HKGrotesk",
        scaffoldBackgroundColor: Color.fromRGBO(0, 67, 67, 1),
        textTheme: TextTheme(
          display1: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white),
          button: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(0, 67, 67, 1),
          ),
          subhead: TextStyle(
            color: Color.fromRGBO(119, 230, 182, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          title: TextStyle(
            color: Color.fromRGBO(0, 67, 67, 1),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          body1: TextStyle(
            color: Color.fromRGBO(0, 67, 67, 1),
            fontSize: 18,
          ),
        ).apply(
          // bodyColor: Color.fromRGBO(0, 67, 67, 1),
          displayColor: Colors.white,
          fontFamily: "HKGrotesk",
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 67, 67, 1), //change your color here
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToSetup() {
    Navigator.of(context).push(
      platformPageRoute(
        context: context,
        builder: (_) => SetupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStack(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 64, left: 56, right: 56),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Easily Track \n Your Expenses',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(height: 1.3),
                  textAlign: TextAlign.center,
                ),
                CustomButton("Let's start", onPressed: _navigateToSetup),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
