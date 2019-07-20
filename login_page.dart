
import 'package:cheetah_check_mobile/forget_dart.dart';
import 'package:cheetah_check_mobile/register_page.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final email = TextFormField
    (
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration
      (
        hintText: 'Email' ,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final password = TextFormField
    (
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration
      (
        hintText: 'Password' ,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );

    final loginButton = Padding
    (
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material
      (
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton
        (
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
    final registerLabel = FlatButton
    (
      child:Text('Sign Up', style:TextStyle(color: Colors.black54),),
      onPressed: () {
        Navigator.of(context).pushNamed(RegisterPage.tag);
      },
    );

    final forgotLabel = FlatButton
    (
      child: Text('Forgot Password?', style:TextStyle(color: Colors.black54),),
      onPressed: () {
        Navigator.of(context).pushNamed(ForgetPage.tag);
      },
    );
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: Center
      (
        child: ListView
        (
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24,right: 24),
          children: <Widget>
          [
            email,
            SizedBox(height: 8.0,),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            registerLabel
          ],
        ),
      ),
    );
  }
}