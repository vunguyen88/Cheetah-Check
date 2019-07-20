import 'package:flutter/material.dart';
import 'tag_list.dart';
import 'add_nfc_btn.dart';

class InstructorHome extends StatefulWidget {
  @override
  _InstructorHomeState createState () => _InstructorHomeState();
}

class _InstructorHomeState extends State<InstructorHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                '[Class Info]',
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 350,
                maxWidth: 350,
                minWidth: 150,
                minHeight: 150,
              ),
              child: TagList()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AddNfcButton(Icons.add_box)
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AddNfcButton(Icons.indeterminate_check_box)
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '[Class Name]: [Session == Active ? "Active" : "Inactive";',
              ),
            ),
          ],
        ),
      ),
    );
  }
}