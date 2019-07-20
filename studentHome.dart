import 'package:flutter/material.dart';
import 'nfcButton.dart';
import 'nfc_fab.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState () => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(30.0),
             child: Text(
                '[Class Info]',
              ),
           ),
            Stack(
              children: <Widget>[
                //This is where an animation will be
                Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Container(
                    height: 250,
                    width: 250,
                    child: FittedBox(
                      child: Container(

                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange,
                              blurRadius: 1.0,
                              spreadRadius: 2.0,
                              offset: Offset(
                                0.0, // Horizontal offset
                                1.0, // Vertical Offset
                              ),
                            ),
                          ],
                        ),
                        child: NFCFab(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '[Checked] == True ? True : False',
              ),
            ),
          ],
        ),
      ),
    );
  }


  }
}