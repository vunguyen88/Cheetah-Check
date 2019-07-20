import 'package:flutter/material.dart';

// IMPORTANT: Use this code to force the splash to sit for 3 seconds

// await new Future.delayed(const Duration(seconds: 3));
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100),
          child: Center(
            child: Column(
              children: <Widget>[
              Icon(
              Icons.check_circle_outline,
              size: 250,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                'Cheetah Check',
                style: new TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            MoveOn();
            ],
          ),
        ),
      ),
    ),);
  }

  Widget moveOn(BuildContext context) {
    async wait 3 seconds

    Navigor code stuff
    -> go to correct page
    if (instructor)
    go to
    here
    else
    go
    elsewhere
  }
}
