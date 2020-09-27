import 'package:flutter/material.dart';

class TabTest extends StatefulWidget {
  @override
  _TabTestState createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height *0.27),
              child: TabBarView(
                children: <Widget>[
                  Icon(Icons.access_time,size: 50,),
                  Icon(Icons.android,size: 50,),
                  Icon(Icons.print,size: 50,),
                  Icon(Icons.fingerprint,size: 50,),
                ],
              ),
            ),
            Container(
              color: Colors.yellow[300],
              height: 3,
              child: TabBar(
                indicatorWeight: 3,
                indicatorColor: Colors.black,
                tabs: <Widget>[
                  Tab(text: ''),
                  Tab(text: ''),
                  Tab(text: ''),
                  Tab(text: ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height *0.2,
            child: TabBarView(
              children: <Widget>[
                Icon(Icons.access_time,size: 50,),
                Icon(Icons.android,size: 50,),
                Icon(Icons.print,size: 50,),
                Icon(Icons.fingerprint,size: 50,),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/4,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(radius: MediaQuery.of(context).size.width/4 /8,backgroundColor: Colors.white38,),
                    CircleAvatar(radius: MediaQuery.of(context).size.width/4 /8,backgroundColor: Colors.white38,),
                    CircleAvatar(radius: MediaQuery.of(context).size.width/4 /8,backgroundColor: Colors.white38,),
                    CircleAvatar(radius: MediaQuery.of(context).size.width/4 /8,backgroundColor: Colors.white38,),
                  ],
                ),
                TabBar(
                  indicatorWeight: MediaQuery.of(context).size.width /4 /8,
                  indicator: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  indicatorColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: '',),
                    Tab(text: '',),
                    Tab(text: '',),
                    Tab(text: '',),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
