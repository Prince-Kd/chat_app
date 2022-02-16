import 'package:chat_app/custom_icons_icons.dart';
import 'package:chat_app/utils/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Map user = ModalRoute.of(context)!.settings.arguments as Map;
    Stream<List> chats() async* {
      var messages = [];
      yield messages;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        //leadingWidth: 15.w,
        title: Row(children: [
          CircleAvatar(),
          SizedBox(
            width: 2.w,
          ),
          Text('Coldblood')
        ]),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: chats(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          return Stack(
            children: [
              Positioned(
                bottom: 0.h,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 1.5.h, left: 1.5.h, right: 1.5.h, bottom: 3.h),
                  //color: Colors.blue,
                  height: 10.h,
                  width: 100.w,
                  child: SizedBox(
                    height: 8.h,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 1.h),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                        filled: true,
                        hintText: 'Message...',
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.h),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: IconButton(onPressed: (){}, icon: Icon(CustomIcons.paper_plane, color: Colors.amber,),),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10.h, left: 4.w, right: 4.w),
                  child: snapshot.hasData
                      ? ListView.builder(
                          padding: EdgeInsets.only(bottom: 0),
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ChatBubble(
                                message: snapshot.data![index],
                                user: user['user']);
                          })
                      : Center(child: CircularProgressIndicator())),
            ],
          );
        },
      ),
    );
  }
}
