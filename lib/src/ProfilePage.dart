import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';
import 'dart:math';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Account account;
  // List<Widget> photos;

  int getLevel(Account account) {
    return pow(((5.0 / 4.0) * account.experience), 1.0 / 3.0).toInt();
  }

  double getPercentage(Account account) {
    return (account.experience - ((4 * pow(getLevel(account), 3)) / 5)) /
        (((4 * pow(getLevel(account) + 1, 3)) / 5) -
            ((4 * pow(getLevel(account), 3)) / 5));
  }

  // getPhotos(Account account) async {
  //   account.postIDs.forEach((post) async {
  //     String url = await Firestore.getDocument('Posts', post)
  //         .then((document) => document.data()['imageURL']);
  //     if (url != null) {
  //       print("new URL" + url);
  //     } else {
  //       print("url is null");
  //     }
  //     photos.add(Image.network(url));
  //   });
  // }

  Widget profileImage(Account account) => Padding(
        padding: EdgeInsets.only(top: 30),
        child: CircularPercentIndicator(
          radius: 200,
          backgroundWidth: 15,
          lineWidth: 15,
          animation: true,
          progressColor: Colors.pink,
          percent: getPercentage(account),
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

  Widget nameAndXP(Account account) => Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Text('${account.username} Level ${getLevel(account)}'),
      );

  Widget header(Account account) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [profileImage(account), nameAndXP(account), headerMenu()],
      );

  Widget bio(Account account) => Container(
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

  Future<DocumentSnapshot> getUserDoc() async {
    User user = await UserManager.getCurrentUser();
    DocumentSnapshot userDoc =
        await Firestore.getDocument('Accounts', user.uid);
    return userDoc;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> profilePage(Account account) => [
          SliverList(
            delegate: SliverChildListDelegate([
              header(account),
              bio(account),
              line(),
            ]),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // children: [this.photos.first],
          ),
        ];
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: getUserDoc(),
            builder: (context, snapshot) {
              account = Account.fromJson(snapshot.data.data());
              // getPhotos(account);
              return CustomScrollView(slivers: profilePage(account));
            }));
  }
}
