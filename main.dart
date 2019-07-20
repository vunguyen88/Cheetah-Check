
import 'package:cheetah_check_mobile/forget_dart.dart';
import 'package:cheetah_check_mobile/register_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget 
{
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    ForgetPage.tag: (context) => ForgetPage()
  };
  @override
  Widget build(BuildContext ctxt) 
  {
    return MaterialApp
    (
      title: 'Cheetah Check',
      theme: ThemeData
      (
        primarySwatch: Colors.lightBlue,
      ),
      home : LoginPage(),
      routes: routes,
    );
  }
}

      

      
