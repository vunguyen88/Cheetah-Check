import 'package:flutter/material.dart';

class AddNfcButton extends StatelessWidget {
  @override
  @required
  var icon;
  AddNfcButton(icon){
    this.icon = icon;
  }

  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        iconSize: 90,
          color: Colors.brown.shade300,
          icon: Icon(icon),
          onPressed: () {
            if (icon == Icons.indeterminate_check_box){
              deleteNfc();
            }
            if (icon == Icons.add_box){
              addNfc();
            }
          }
      )
    );
  }

  void deleteNfc() {
    print('A tag is being removed.');
  }

  void addNfc() {
    print('A tag is being added.');
  }
}
