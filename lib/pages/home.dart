import 'package:chat_app/widgets/action.dart';
import 'package:chat_app/widgets/chat_tile.dart';
import 'package:chat_app/widgets/custom_search.dart';
import 'package:chat_app/widgets/dialog.dart';
import 'package:chat_app/widgets/placeholder_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<List> getMessages() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield [];
  }

  void action1() async {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  void action2() {
    Navigator.pop(context);
  }

  void logout() async {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: 'Logout',
            content: ''
                'Want to logout?',
            type: 'info',
            action1: AlertAction(function: action1, text: 'YES'),
            action2: AlertAction(function: action2, text: 'NO'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, Box box, widget) {
        var user = box.get('user');
        print(user);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: const Text('CHATS'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: (){},
                            child: Row(
                              children: [
                                const Icon(Icons.person, color: Colors.grey,),
                                SizedBox(width: 1.h,),
                                Text(
                                  "Account",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                              ],
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            onTap: logout,
                            child: Row(
                              children: [
                                const Icon(Icons.logout, color: Colors.deepPurpleAccent),
                                SizedBox(width: 1.h,),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.deepPurpleAccent),
                                ),
                              ],
                            ),
                            value: 2,
                          )
                        ])
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(2.h),
              child: StreamBuilder(
                stream: getMessages(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.separated(
                        itemBuilder: (context, index) => ChatTile(),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                        itemCount: 2);
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) => PlaceholderTile(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 2.h,
                          ),
                      itemCount: 5);
                },
              ),
            ));
      }
    );
  }
}
