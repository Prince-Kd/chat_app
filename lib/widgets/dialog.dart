
import 'package:chat_app/widgets/action.dart';
import 'package:chat_app/widgets/dialog_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDialog extends StatelessWidget {
  String? title;
  String? content;
  String? type;
  AlertAction? action1;
  AlertAction? action2;

  CustomDialog(
      {Key? key,
      this.title,
      this.content,
      this.type,
      this.action1,
      this.action2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogDetails details = DialogDetails(
        context: context,
        title: title!,
        type: type,
        content: content,
        action1: action1,
        action2: action2);
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.h),
      ),
      //insetPadding: const EdgeInsets.all(40),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 2.h, top: 5.h, right: 2.h, bottom: 2.h),
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(2.h)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  details.title!,
                  style: TextStyle(
                    color: details.titleColor(),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  details.content!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                details.actionButtons()
              ],
            ),
          ),
          Positioned(
              right: 2.h,
              left: 2.h,
              child: Align(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: details.icon()
                ),
              )),
        ],
      ),
    );
  }
}
