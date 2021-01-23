import 'package:flutter/material.dart';

Widget getImage(BuildContext context) => Image.network("https://picsum.photos/250/150",
    fit: BoxFit.fitWidth,
    width: MediaQuery.of(context).size.width
  // loadingBuilder: (context, child, progress) => {
  //     return progress == null ? child : LinearProgressIndicator()
  // },
);

Widget postDetails() => Row(
  children: [
    Text('<UserName>'),
    Spacer(),
    IconButton(icon: Icon(Icons.expand_more_outlined), onPressed: () => {})
  ],
);

Widget actionsBar() => Row(
  children: [
    IconButton(icon: Icon(Icons.star_border), onPressed: () => {}),
    IconButton(icon: Icon(Icons.message_outlined), onPressed: () => {}),
    IconButton(icon: Icon(Icons.send_sharp), onPressed: () => {}),
    Spacer(),
    IconButton(icon: Icon(Icons.collections_bookmark_outlined), onPressed: () => {}),
  ],
);

Widget cardContent(BuildContext context) => Container(
  child: Column(
    children: [
      postDetails(),
      getImage(context),
      actionsBar()
    ],
  ),
);

class PostCardWidget extends StatelessWidget {


  PostCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: cardContent(context),
    );
  }
}

