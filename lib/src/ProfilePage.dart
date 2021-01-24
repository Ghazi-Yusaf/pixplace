import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


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

Widget profileImage() => CircularPercentIndicator(
    radius: 200,
    backgroundWidth: 15,
    lineWidth: 15,
    animation: true,
    progressColor: Colors.pink,
    percent: 0.35,
    center: Container(
      width:170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://picsum.photos/250/150")
        )
      )
    ),
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
         Text("name"), Text("level"),
        ],
      ),
    ),
    headerMenu()
  ],
);


Widget gridGallery() => GridView.count(
  crossAxisCount: 3,
    scrollDirection: Axis.vertical,

    children: List.generate(10, (i)  {
      return Center(
        child: Text(
        "$i"
      ),
   );
})
);


class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            header(),
           // NestedScrollView(body: gridGallery())
          ],
        )
    );
  }
}