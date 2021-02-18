import 'package:flutter/material.dart';
import 'package:pixplace/pages.dart';


class DataSearch extends SearchDelegate<String>{
  String get searchFieldLabel => 'Search PixPlace';
  final users = ['Abhishek Saini','Peter Smith','Laura Clark', 'David Anderson', 'Katy Scott','Andrew Scott'];
  final recentSearches = ['Peter Smith','Katy Scott'];
  final userNames = ['a_saini','peterSmith2','laurClark99','danderson','katie_s4','andyScott'];
  final index = 0;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        showSearch(context: context, delegate: DataSearch());
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
    return ListView.builder(
      itemBuilder: (BuildContext context, index){
        return ListTile(
          // title: Text(data[index]['id']),
          //subtitle: Text(data[query]['firstName']),
          leading: Icon(Icons.person_rounded),
          title: Text(query),
          onTap: ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  ProfilePage() // placeholder, use to navigate to query location
              )
          ),
        );
      },
      itemCount: 1,
      //itemCount: 1,
    );
    //future: DefaultAssetBundle.of(context).loadString("assets/json/users.json"),
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestedUsers = (query.isEmpty?recentSearches:users.where((element) => element.startsWith(query)).toList());

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap: ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ProfilePage() // placeholder, use to navigate to query location
            )
        ),
        leading: Icon(Icons.person_rounded),
        title: RichText(text: TextSpan(
            text: suggestedUsers[index].substring(0,query.length),
            style: TextStyle(color: Colors.black),
            children: [TextSpan(
                text: suggestedUsers[index].substring(query.length),
                style: TextStyle(color: Colors.grey)),
            ]
        )),

        //subtitle: Text(suggestedUsernames[index]),
      ),
      itemCount: suggestedUsers.length,

    );
  }

}