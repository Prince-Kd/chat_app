import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.5.h)
      ),
      tileColor: Colors.grey[300],
      leading: SizedBox(
        child: CircleAvatar(
          backgroundColor: Colors.grey[500],
          radius: 2.h,
        ),
      ),
      title: Text(''),
      subtitle: Text(''),
      onTap: (){

      },
    ));
  }
}
