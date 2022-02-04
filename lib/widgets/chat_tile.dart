import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      tileColor: Colors.grey[300],
      leading: CircleAvatar(
        backgroundColor: Colors.grey[500],
        radius: 20,
      ),
      title: Text(''),
      subtitle: Text(''),
    ));
  }
}
