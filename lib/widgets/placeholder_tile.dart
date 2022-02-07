import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlaceholderTile extends StatelessWidget {
  const PlaceholderTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.5.h)
      ),
      tileColor: Colors.grey[300],
      leading: CircleAvatar(
        backgroundColor: Colors.grey[500],
        radius: 2.h,
      ),
      title: Container(
        height: 1.h,
        width: 5.w,
        color: Colors.grey,
      ),
      subtitle: Container(
        height: 1.h,
        width: 10.w,
        color: Colors.grey,
      ),
    );
  }
}
