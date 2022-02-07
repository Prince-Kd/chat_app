import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadinDialog extends StatelessWidget {
  const LoadinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 30.w,),
            Text('Loading...', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}
