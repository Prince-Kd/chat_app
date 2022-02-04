import 'package:chat_app/widgets/chat_tile.dart';
import 'package:chat_app/widgets/custom_search.dart';
import 'package:chat_app/widgets/placeholder_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<List> getMessages() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield [];
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
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
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Account",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepPurpleAccent),
                            )),
                        value: 2,
                      )
                    ])
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            stream: getMessages(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.separated(
                    itemBuilder: (context, index) => ChatTile(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 2);
              }
              return ListView.separated(
                  itemBuilder: (context, index) => PlaceholderTile(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 5);
            },
          ),
        ));
  }
}
