import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../widgets/SliverHeader.dart';

Widget profileImage() => Padding(
      padding: EdgeInsets.only(top: 40),
      child: CircularPercentIndicator(
        radius: 200,
        backgroundWidth: 15,
        lineWidth: 15,
        animation: true,
        progressColor: Colors.pink,
        percent: 0.35,
        center: Container(
            width: 165,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://picsum.photos/250/150")))),
      ),
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
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Text(name + " " + xp.toString() + "XP"),
    );

Widget header() => Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    profileImage(),
    nameAndXP("name", 2000),
    headerMenu()],
);

Widget bio() => Container(
  color: Colors.white,
  height: 10.0,
  child: Padding(
    padding: const EdgeInsets.all(40.0),
    child: Center(child:
      Text("How we live our life is far more important than how we say we live our life"),
    ),
  ),
);

List<Widget> profilePage = [
  SliverGrid.count(
    crossAxisCount: 1,
    children: [
      header(),
      bio()
    ],
  ),
];


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name'),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: profilePage),
      ),
    );
  }
}
