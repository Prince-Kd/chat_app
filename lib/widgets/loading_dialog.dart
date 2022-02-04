import 'package:flutter/material.dart';

class LoadinDialog extends StatelessWidget {
  const LoadinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 30,),
            Text('Loading...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}
