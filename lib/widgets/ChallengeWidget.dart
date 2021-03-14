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

  ChallengeWidget({Key key,@required this.challengeID}) : super(key: key);

  Future<int> getProgress() async{
      Query posts = Firestore.getCollection('Posts').where('userId', isEqualTo: await UserManager.getCurrentUser().then((user) => user.uid)).where('tagId', isEqualTo: 'Dog' );
      int amountCompleted = await posts.snapshots().length;
      if(await posts.snapshots().length == null){
        return 0;
      }else{
        return amountCompleted;
      }
  }

  Future<double> getPercent() async{
    int amountCompleted = await getProgress();
    double percent = amountCompleted/5.0;
    if (percent >= 1.0){
      return 1.0;
    }
    else{
      return percent;
    }
  }

  Widget percentIndicator(){
    return FutureBuilder(
        future: getPercent(),
        builder: (BuildContext context, AsyncSnapshot<double> percent){
          if (!percent.hasData) {
            return Text("Failed to load Progress");
          }
          if (percent.hasError){
            return Text('An error has occured, please try again later.');
          }
         else{
            return LinearPercentIndicator(
              width: 100,
              alignment: MainAxisAlignment.center,
              lineHeight: 20,
              percent: percent.data,
              backgroundColor: Colors.grey,
              progressColor: Colors.pink,
              trailing: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("500 XP" ,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100))),
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
                          getProgress().toString() + " out of 5"
                      ),
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