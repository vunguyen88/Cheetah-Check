import 'package:flutter/material.dart';
import 'package:cheetah_check_refactor/backend/user.dart';

class InstructorPage extends StatefulWidget {
  InstructorPage({Key key, this.user}) : super(key: key);

  static String tag = 'instructor-page';

  final String title = 'Instructor Home';
  final User user;

  @override
  _InstructorPageState createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  var classInfo;
  var nfcTags = [
    'Tag 1',
    'Tag 2',
    'Tag 3',
    'Tag 4',
    'Tag 5',
    'Tag 6',
    'Tag 7',
    'Tag 8',
    'Tag 9',
    'Tag 10',
  ];

  @override
  void initState() {
    super.initState();

    print("[DEBUG] Getting instructor user info.");

    print("-> Checking if user is initialized.");
    if (widget.user != null) {
      print('--> User is intialized.');

      print('-> Checking if class info is initialized.');
      if (widget.user.classInfo != null) {
        print('-->[SUCCESS] Class info is initialized.');
        classInfo = widget.user.classInfo;
      } else {
        print('-->[ERROR] User is initialized but class info is not.');
        classInfo = "[No Class Info in DB]";
      }
    } else {
      print('-->[ERROR] User is null.');
      classInfo = "[No Class Info in DB]";
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final classInfoField = Padding(
      padding: EdgeInsets.symmetric(
        vertical: height/16,
        horizontal: width/16,
      ),
      child: Text(
        classInfo,
        style: TextStyle(
          fontSize: height / 25,
        ),
      ),
    );

    Widget _nfcTagItem(BuildContext context, int index) {
      return Container(
        child: Card(
          child: Container(
            height: height / 15,
            width: width / 2,
            child: new Center(
              child: Text(
                nfcTags[index],
                style: TextStyle(
                  fontSize: height / 30,
                ),
              ),
            ),
          ),
        ),
      );
    }

    final nfcListBox = Padding(
      padding: EdgeInsets.symmetric(
        
        horizontal: width/16,
      ),
      child: Container(
        height: height * 2/5,
        width: width * 4/5,
        decoration: BoxDecoration(
          border: new Border.all(),
          borderRadius: new BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: height / 15,
              child: Center(
                child: Text('Your NFC Tags',
                    style: TextStyle(
                      fontSize: height / 25,
                    )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _nfcTagItem,
                itemCount: nfcTags.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );

    _nfcOnPress() {
      print('[DEBUG] NFC Functionality');
      // Ensure database is responsive
      print('-> Checking if user is intialized.');
      if (widget.user != null) {
        print('--> User is intialized.');
        return true;
      } else {
        //checkInText = "You're not logged in. How are you here?";
        print('-->[ERROR] Cannot add tag to null user.');
        return false;
      }
    }

    _addTag() {
      setState(() {
        print('Tag addition feature.');
      });
    }

    _deleteTag() {
      setState(() {
        print('Tag deletion feature.');
      });
    }

    final nfcButtons = Padding(
      padding: EdgeInsets.symmetric(
      vertical: height/16,
      horizontal: width/16,
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              iconSize: width / 4,

              icon: Icon(Icons.add_box),
              onPressed: () {
                _nfcOnPress() ? _addTag() :
                print('-->[ERROR] Tag addition failed.');
              }),
          IconButton(
              iconSize: width / 4,

              icon: Icon(Icons.indeterminate_check_box),
              onPressed: () {
                _nfcOnPress() ? _deleteTag() :
                  print('-->[ERROR] Tag deletion failed.');
              }),
        ],
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
            nfcListBox,
            nfcButtons,
          ],
        ),
      ),
    );
  }
}
