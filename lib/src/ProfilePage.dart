import 'package:flutter/material.dart';


Widget headerMenu() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 45.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.add_circle_rounded,
        color: Colors.green,
        size: 45.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.star,
        color: Colors.amber,
        size: 45.0,
      ),
    ),
  ],
);


Widget profileImage() => Stack(
  alignment: const Alignment(0.0, 0.0),
  children: [
    Container(
      decoration: new BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.yellow, Colors.white],
              stops: [0.65, 1.0]
          )
      ),
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
      ),
    ),
    Container(
      width: 75,
      height: 75,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 100,
      ),
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   image: DecorationImage(
      //     // image: new AssetImage("assets/images/portrait.jpg"),
      //     fit: BoxFit.cover,
      //
      //   )
      // ),
    ),
    CircleAvatar(
      radius: 75,
      backgroundColor: Colors.blue,
    ),
  ],
);


Widget header() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: profileImage()
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Text(
            "name",
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.black
            ),
          ),
          Text(
            "level",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.deepOrange
            ),
          ),
        ],
      ),
    ),
    headerMenu()
  ],
);


Widget gridGallery() => GridView.count(
  crossAxisCount: 2,
    children: List.generate(10, (i) => Center(
      child: Text('Item $i'),
    ))
);


class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            header(),
            // gridGallery()
          ],
        )
    );
  }
}