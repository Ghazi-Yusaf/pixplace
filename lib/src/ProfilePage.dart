import 'package:flutter/material.dart';

Widget _buildStack() => Stack(
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


class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStack(),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ],
        )
      );
  }
}
