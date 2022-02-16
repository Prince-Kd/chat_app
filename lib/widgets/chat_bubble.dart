import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatBubble extends StatelessWidget {
  final dynamic message;
  final String user;
  const ChatBubble({Key? key, this.message, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('1 $user');
    print('2 ${message.user}');
    return Align(
      alignment: message.user == user ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Bubble(
        margin: BubbleEdges.only(top: 2.h),
        padding: BubbleEdges.symmetric(vertical: 1.h),
        nip: message.user == user ? BubbleNip.rightTop : BubbleNip.leftTop,
        color: message.user == user ? Color.fromRGBO(225, 255, 199, 1.0) : null,
        child: Text(message.text, style: TextStyle(fontSize: 13.sp), textAlign: message.user == user ? TextAlign.right : TextAlign.left),
      ),
    );
  }
}
