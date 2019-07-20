import 'package:flutter/material.dart';
import 'studentHome.dart';
import 'instructorHome.dart';
import 'splash.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  var isInstructor = false;
  var isLoggedIn = true;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Splash();
    if(widget.isLoggedIn){
      if(widget.isInstructor) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Instructor Page'),
          ),
          body: Center(
              child: InstructorHome()
          ),
        );
      }
      else{
        return Scaffold(
          appBar: AppBar(
            title: Text('Student Page'),
          ),
          body: Center(
              child: StudentHome()
          ),
        );
      }
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login/Signup'),
        ),
        body: Center(
          child: Text(
           'Sign-up/Register'
          )
        ),
      );
    }
  }
}