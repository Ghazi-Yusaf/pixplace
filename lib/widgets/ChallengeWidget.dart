import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pixplace/entities/Post.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixplace/entities/Account.dart';
import 'package:pixplace/firebase/Firestore.dart';
import 'package:pixplace/firebase/UserManager.dart';


class ChallengeWidget extends StatelessWidget {

  String challengeID;
  int progress;
  ChallengeWidget({Key key,@required this.challengeID}) : super(key: key);

  Widget percentIndicator(){
    return FutureBuilder(
        future: Firestore.getCollection('Posts').where('userId', isEqualTo: '9TfxvYMzioWxn2EuINSlyjDMbSb2').where('tagID', isEqualTo: 'Dog' ).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> percent){
          if (!percent.hasData) {
            this.progress = 0;
            return Container(
              child: Column(
                children: [
                  LinearPercentIndicator(
                    width: 100,
                    alignment: MainAxisAlignment.center,
                    lineHeight: 20,
                    percent: 0,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.pink,
                    trailing: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("500 XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25,),),
                  Text(
                      "0 out of 5"
                  ),
                ],
              ),
            );
          }
          if(percent.data.docs.length>= 5){
            this.progress = 5;
            return Container(
              child: Column(
                children: [
                  LinearPercentIndicator(
                    width: 100,
                    alignment: MainAxisAlignment.center,
                    lineHeight: 20,
                    percent: 1,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.pink,
                    trailing: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("500 XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25,),),
                  Text(
                      "5 out of 5"
                  ),
                ],
              ),
            );
          }
          if (percent.hasError){
            this.progress = 0;
            return Text('An error has occured, please try again later.');
          }
         else{
            return Container(
              child: Column(
                children: [
                  LinearPercentIndicator(
                    width: 100,
                    alignment: MainAxisAlignment.center,
                    lineHeight: 20,
                    percent: percent.data.docs.length/5,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.pink,
                    trailing: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("500 XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25,),),
                  Text(
                      percent.data.docs.length.toString() + " out of 5"
                  ),
                ],
              ),
            );
          }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
          future: Firestore.getDocument('Challenges', challengeID),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> document) {

            if (!document.hasData) {
              return Text("Challenge Unavailable");
            }
            if (document.hasError){
              return Text('An error has occured, please try again later.');
            }
            else {
              Map<String, dynamic> data = document.data.data();
              return Container(
                child: Column(
                    children: [
                      Text(
                        data['name'],
                        style: TextStyle(fontSize: 30),
                      ),
                      Padding(padding: EdgeInsets.only(top: 25)),
                      Text(
                        data['description'],
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(padding: EdgeInsets.only(top: 25,),),
                      percentIndicator(),
                      Padding(padding: EdgeInsets.only(top: 25,),),
                      Text(
                          data['deadline'].toString() + " remaining"
                      ),
                    ]
                ),
              );
            }
          }
      );




  }





}