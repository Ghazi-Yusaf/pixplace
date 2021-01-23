import 'package:flutter/material.dart';

import 'package:pixplace/widgets/PostCardWidget.dart';




class Feed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: List.generate(3, (index) => PostCardWidget())
          )
      ),
    );
  }
}