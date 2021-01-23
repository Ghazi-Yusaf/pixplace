import 'package:flutter/material.dart';

Widget getImage(BuildContext context) => Image.network("https://picsum.photos/250/150",
    fit: BoxFit.fitWidth,
    width: MediaQuery.of(context).size.width
  // loadingBuilder: (context, child, progress) => {
  //     return progress == null ? child : LinearProgressIndicator()
  // },
);

// Widget imageThumb() => Flex(direction: Axis.horizontal,
//     children: [
//       Expanded(child: getImage()),
//     ]
// );


// ListTile(
//   title: Text('<UserName>'),
// ),
// TextButton(
//   child: const Text('<Like>'),
//   onPressed: () {/* ... */},
// ),
// const SizedBox(width: 8),
// TextButton(
//   child: const Text('<Comment>'),
//   onPressed: () {/* ... */},
// ),
// const SizedBox(width: 8)

Widget cardContent(BuildContext context) => Container(
  child: Column(
    children: [
      getImage(context),
      Text('<Like>'),
      ListTile(
        title: Text('<UserName>'),
      ),
      TextButton(
        child: const Text('<Like>'),
        onPressed: () {/* ... */},
      ),
      const SizedBox(width: 8),
      TextButton(
        child: const Text('<Comment>'),
        onPressed: () {/* ... */},
      )
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

