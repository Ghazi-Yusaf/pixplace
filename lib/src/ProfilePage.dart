import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


Widget profileImage() => Padding(
      padding: EdgeInsets.only(top: 30),
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

Widget headerMenu() => Padding(
  padding: EdgeInsets.only(bottom:20),
  child: Row(
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
      ),
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
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal : 40.0, vertical: 10.0),
    child: Center(child:
      Text("How we live our life is far more important than how we say we live our life ", textAlign: TextAlign.center,),
    ),
  ),
);

Widget line() => Container(
  color: Colors.pink,
  height: 2,

);


List<Widget> profilePage = [
  SliverList(
      delegate: SliverChildListDelegate([
      header(),
      bio(),
      line(),
  ]),
  ),

  SliverGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: [
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover,),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
        Image.network("https://picsum.photos/250/150",fit: BoxFit.cover),
      ],
  ),
];


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: profilePage),
    );
  }
}
