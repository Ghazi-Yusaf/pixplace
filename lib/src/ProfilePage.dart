import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


Widget profileImage() => Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: CircularPercentIndicator(
      radius: 200,
      backgroundWidth: 15,
      lineWidth: 15,
      animation: true,
      progressColor: Colors.pink,
      percent: 0.35,
      center: Container(
          width:165,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://picsum.photos/250/150")
              )
          )
      ),
    )
);


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


Widget nameAndXP(String name, int xp) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 15.0),
  child: Column(
    children: [
      Text(name), Text(xp.toString() + "XP"),
    ],
  ),
);


Widget header() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    profileImage(),
    nameAndXP("name", 2000),
    headerMenu(),
    // gridGallery()
  ],
);







Widget gridView() => GridView.count(
  crossAxisCount: 1,
  children: List.generate(4, (index) => Text(index.toString())),
);

Widget gridGallery() => SizedBox(
  height: 100,
  child: gridView(),
);





class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return header();
  }
}