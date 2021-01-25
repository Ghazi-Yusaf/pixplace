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
      children: [profileImage(), nameAndXP("name", 2000), headerMenu()],
    );

List<Widget> headerSection = [
  SliverGrid.count(
    crossAxisCount: 1,
    children: [
      Column(
        children: [
          profileImage(),
          nameAndXP("name", 2000),
          headerMenu(),
          Container(
            color: Colors.white,
            height: 10.0,
            child: Center(child: Text("Bio\n\n")),
          )
        ],
      ),
    ],
  ),
];

// throphies\n\nfriends

List<Widget> profilePageSlivers = <Widget>[
  ...headerSection,
  sliverHeader('Posts'),
  SliverGrid.count(
    crossAxisCount: 2,
    children: List<Widget>.generate(
        6,
        (index) => Container(
              height: 150,
            )),
  ),
  sliverHeader('challenges'),
  SliverGrid(
    gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200.0,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 4.0,
    ),
    delegate: new SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return new Container(
          alignment: Alignment.center,
          color: Colors.teal[100 * (index % 9)],
          child: new Text('grid item $index'),
        );
      },
      childCount: 20,
    ),
  ),
  sliverHeader('leaderboard position'),
  // Yes, this could also be a SliverFixedExtentList. Writing
  // this way just for an example of SliverList construction.
  SliverList(
    delegate: SliverChildListDelegate(
      [
        Container(color: Colors.pink, height: 600.0),
        Container(color: Colors.cyan, height: 150.0),
        Container(color: Colors.indigo, height: 150.0),
        Container(color: Colors.blue, height: 150.0),
      ],
    ),
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
        body: CustomScrollView(slivers: profilePageSlivers),
      ),
    );
  }
}
