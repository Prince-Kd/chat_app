import 'package:flutter/material.dart';

class PlaceholderTile extends StatelessWidget {
  const PlaceholderTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      tileColor: Colors.grey[300],
      leading: CircleAvatar(
        backgroundColor: Colors.grey[500],
        radius: 20,
      ),
      title: Container(
        height: 10,
        width: 50,
        color: Colors.grey,
      ),
      subtitle: Container(
        height: 10,
        width: 100,
        color: Colors.grey,
      ),
    );
  }
}
