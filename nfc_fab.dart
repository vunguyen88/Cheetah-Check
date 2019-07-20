import 'package:flutter/material.dart';

// This creates the student read button.

class NFCFab extends StatefulWidget {
  @override
  _NFCFabState createState() => _NFCFabState();
}

class _NFCFabState extends State<NFCFab> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.check,
        size: 50,
        color: Colors.orangeAccent,
      ),
      onPressed: (){
        print("NFC Functionality");
      },
    );
  }
}