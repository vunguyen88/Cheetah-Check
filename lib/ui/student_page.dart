import 'package:flutter/material.dart';
import 'package:cheetah_check_refactor/backend/user.dart';

class StudentPage extends StatefulWidget {
  StudentPage({Key key, this.user}) : super(key: key);

  static String tag = 'student-page';

  final String title = 'Student Check-In';
  final User user;

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  var classInfo;
  var checkInText;
  var checkInBool;

  @override
  void initState() {
    super.initState();

    print("[DEBUG] Getting student user info.");

    print("-> Checking if user is initialized.");
    if (widget.user != null) {
      print('--> User is intialized.');

      print('-> Checking if class info is initialized.');
      if (widget.user.classInfo != null) {
        print('-->[SUCCESS] Class info is initialized.');
        classInfo = widget.user.classInfo;
      }
      else {
        print('-->[ERROR] User is initialized but class info is not.');
        classInfo = "[No Class Info in DB]";
      }

      print('-> Checking if check-in status is initialized.');
      if(widget.user.checkInBool != null) {
        print('-->[SUCCESS] Check-in status is initialized to '
          + checkInBool + ".");
        checkInBool = widget.user.checkInBool;
        checkInText = checkInBool ? 'Checked-in!' : 'Not checked-in!' ;
      }
    }
    else {
      print('-->[ERROR] User is null.');
      classInfo = "[No Class Info in DB]";
      checkInText = "[No Check-In Info in DB]";
    }
  }

  void _nfcOnPress() {
    print('[DEBUG] NFC Functionality');
    // Send query to db checking in user
    setState(() {
      print('-> Checking if user is intialized.');
      if (widget.user != null) {
        print('--> User is intialized.');
        print('-> Checking if check-in status initialized.');
        if (widget.user.checkInBool != null) {
          print('--> Check-in status is initialized.');
          print('-> Checking if user has been checked-in.');
          if (widget.user.checkInBool == true) {
            checkInText = "Check in successful";
            print('-->[SUCCESS] Successfully checked in user.');
          } else {
            checkInText = "Unsuccessful. Try again?";
            print('-->[ERROR] User is initialized but some other error occured.');
          }
        } else {
          print('-->[ERROR] User is initialized but check-in status is not initialized.');
        }
      } else {
        checkInText = "You're not logged in. How are you here?";
        print('-->[ERROR] Cannot check-in null user.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final classInfoField = Padding(
      padding: EdgeInsets.only(
        top: height / 15,
      ),
      child: Text(
        classInfo,
        style: TextStyle(
          fontSize: height / 28,
        ),
      ),
    );

    final nfcButton = Container(
      height: height * 2/3,
      width: width * 2/3,
      child: FittedBox(
        child: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                spreadRadius: 0.75,
                offset: Offset(
                  0.0, // Horizontal offset
                  0.5, // Vertical Offset
                ),
              ),
            ],
          ),
          child: FloatingActionButton(
            child: Icon(
              Icons.check,
              size: height / 15,
            ),
            onPressed: _nfcOnPress,
          ),
        ),
      ),
    );

    final checkInStatusField = Text(
      checkInText,
      style: TextStyle(
        fontSize: height / 35,
      ),
    );

    return Scaffold(
      appBar: AppBar
        (
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            classInfoField,
            nfcButton,
            checkInStatusField,
          ],
        ),
      ),
    );
  }
}
