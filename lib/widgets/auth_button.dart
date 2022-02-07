import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthButton extends StatefulWidget {
  final double height;
  final Widget content;
  final Color color;
  final bool loading;
  final dynamic method;
  const AuthButton({Key? key, required this.content, this.color = Colors.amber, required this.method, this.height = 7, this.loading = false}) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: widget.loading ? Colors.grey : widget.color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.h)
            )
        ),
        onPressed: widget.method,
        child: widget.content,
      ),
    );
  }
}
