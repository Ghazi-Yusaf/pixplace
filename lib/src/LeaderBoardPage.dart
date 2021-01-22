import 'package:flutter/material.dart';


class LeaderBoardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("dsf"),
    // );
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              height: 50.0,
              child: new TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car,color: Colors.grey,)),
                  Tab(icon: Icon(Icons.directions_transit,color: Colors.grey)),
                  Tab(icon: Icon(Icons.directions_bike,color: Colors.grey)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

}
