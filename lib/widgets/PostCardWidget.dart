import 'package:flutter/material.dart';

<<<<<<< Updated upstream:lib/widgets/PostCardWidget.dart
class PostCardWidget extends StatelessWidget {
  PostCardWidget({Key key}) : super(key: key);
=======
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "PixPlace",
          style:TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
>>>>>>> Stashed changes:lib/src/HomePage.dart
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('<UserName>'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('<Like>'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('<Comment>'),
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