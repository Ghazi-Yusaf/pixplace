import 'package:flutter/material.dart';

Widget profileAvatar() => Stack(
  alignment: const Alignment(0, 0),
  children: [
    CircleAvatar(
      backgroundImage: AssetImage('assets/icons/AppIcon.jpg'),
      radius: 100,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
    ),
  ],
);

Widget header() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: profileAvatar(),
    ),
    Text(
        'name'
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("btn"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("btn"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("btn"),
        ),
      ],
    )
  ],
);

class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            header()
          ],
        )
      );
  }
}
