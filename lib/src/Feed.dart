import 'package:flutter/material.dart';

import 'package:pixplace/widgets/PostCardWidget.dart';




class Feed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: [PostCardWidget(postId: 'e56c20d0-761d-11eb-a8da-7982e6dec78a'),]
          )
      ),
    );
  }
}