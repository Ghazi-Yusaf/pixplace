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


Widget header() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: CircleAvatar(
        // backgroundImage: AssetImage('assets/AppIcon.jpg'),
        radius: 100,
        backgroundColor: Colors.blue,
      ),
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


Widget gridGallery() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(0),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: [
      Container(
        color: Colors.black,
        child: Text("img"),
      )
    ]
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
