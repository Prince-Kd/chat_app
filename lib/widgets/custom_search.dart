import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.grey),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    return StreamBuilder(
        stream: resultStream(query),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index] ?? 'No data found'),
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }
}

List<String> items = [
  'Banana',
  'apple',
  'orange',
  'pineapple',
  'pear',
  'strawberry',
  'kiwi',
  'blackberry',
];

Stream<List> resultStream(String text) async* {
  List<String> results = [];
  for (String item in items) {
    if (item.toLowerCase().contains(text.toLowerCase())) {
      results.add(item);
    }
  }
  yield results;
}
