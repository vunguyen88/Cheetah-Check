import 'package:flutter/material.dart';

// This creates the student read button.

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              const Radius.circular(10.0),
            ),
            color: Colors.amber.shade200,
            border: new Border.all(
              color: Colors.brown.shade800,
              width: 4.0,
              style: BorderStyle.solid,
            )
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                    color: Colors.brown.shade900,
                    width: 6.0,
                    style: BorderStyle.solid,
                  )
                )
              ),
              height: 55,
              child: Center(
                child: Text(
                    'NFC Tags',
                    style: TextStyle(
                      fontSize: 25
                    ),
                ),
              ),
            ),
            Container(
              height: 269,
              color: Colors.brown.shade400,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: nfcTags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      color: Colors.amberAccent.shade100,
                      child: Container(
                        height: 40,
                        child: new Center(
                          child: Text(
                            nfcTags[index],
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                        ),
                      ),
                    ),
                  );},
              ),
            ),

          ],
        ),
      ),
    );
  }
}
