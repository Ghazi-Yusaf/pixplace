import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title:Text("PixPlace", style:TextStyle(color: Colors.black)),backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),color: Colors.black, onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(),
      body: MyStatelessWidget(),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  String get searchFieldLabel => 'Search PixPlace';
  final sample = ['sample1','sample2','sample3'];
  final recentSearches = ['sample4','sample5','sample6'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty?recentSearches:sample.where((element) => element.startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_history_rounded),
        title: RichText(
            text: TextSpan(
                text: suggestions[index].substring(0,query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestions[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)
                  )]
            )),
      ),
      itemCount: suggestions.length,
    );
  }

}
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Search for users, posts and challenges.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('<test>'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('<test>'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}