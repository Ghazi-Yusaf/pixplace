import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';

Account account;
List<Widget> photos = [];

getPhotos() async {
  account.postIDs.forEach((post) async {
    String url = await Firestore.getDocument('Posts', post).then((document) => document.data()['imageURL']);
    if(url != null){
      print("new URL" + url);
    }else{print("url is null");}
    photos.add(Image.network(url));
  });
}

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
                    image: AssetImage('assets/images/userAvatar.png')))),
      ),
    );

Widget headerMenu() => Padding(
      padding: EdgeInsets.only(bottom: 20),
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

Widget nameAndXP() => Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Text('${account.username} ${account.experience}XP'),
    );

Widget header() => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [profileImage(), nameAndXP(), headerMenu()],
    );

Widget bio() => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Center(
          child: Text(
            account.bioText,
            textAlign: TextAlign.center,
          ),
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
    children: [photos.first],
  ),
];

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
          future: UserManager.getCurrentUser().then((user) => user.uid),
          builder: (context, user) {
            return FutureBuilder<DocumentSnapshot>(
                future: Firestore.getDocument('Accounts', user.data),
                builder: (context, first) {
                  account = Account.fromJson(first.data.data());
                  getPhotos();
                  return CustomScrollView(slivers: profilePage);
                });
          }),
    );
  }
}
