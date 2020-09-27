/*

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/UI/MyClipperTraingle.dart';
import 'package:untitled5/pages/homepage.dart';

class CancerType extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CancerType> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: ClipPath(
                  clipper: MyClipper1(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                ),
              ),          ///this is clipPath witch u want to put above screen
              Positioned(
                top: 30,
                left: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: new Center(
                        child: CircleAvatar(
                          backgroundColor: Color(0xffEEEEEE),
                          radius: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      right: 30,
                      bottom: 30,
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: Color(0xff7A54DF),
                          radius: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 30,
                      right: 30,
                      bottom: 45,
                      child: Container(
                        child: Image.asset(
                          'images/cancer23.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 5,
                child: FlatButton(
                  child: Image.asset(
                    'images/back.png',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(MyApp());
                  },
                ),
              ),
            ],
          ),
          GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 230, bottom: 12, right: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 40.0,



                        ),
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff7A54DF),
                          radius: 40,
                          child: FlatButton(
                            child: Image.asset(
                              'images/doctorteam.png',
                              width: 50,
                              height: 50,
                            ),
                            onPressed: () {
                              print(Text('الايقونة ( 6) '));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230, bottom: 12, right: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 50, bottom: 12),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 50,
                  bottom: 12,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 50,
                  bottom: 12,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 50,
                  bottom: 12,
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(

                          top: 40.0,



                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7A54DF),
                                Color(0xff7A54DF),
                              ],
                            )),
                        child: FlatButton(
                          child: Image.asset(
                            'images/doctorteam.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {
                            print(Text('الايقونة ( 6) '));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'المقدمة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 50),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.9],
                      colors: [
                        Colors.white,
                        Color(0xffEEEEEE),
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(

                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff7A54DF),
                                  Color(0xff7A54DF),
                                ],
                              )),
                          child: FlatButton(
                            child: Image.asset(
                              'images/doctorteam.png',
                              width: 50,
                              height: 50,
                            ),
                            onPressed: () {
                              print(Text('الايقونة ( 6) '));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          ' المقدمة',



                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xff7A54DF),
        buttonBackgroundColor: Color(0xff7A54DF),
        height: 60,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 2,
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.more_horiz, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.height - 20, size.height - 100);
    var controllpoint = Offset(100, size.height);
    var endPoint = Offset(size.height, size.height);
    //path.quadraticBezierTo(controllpoint.dx, controllpoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
    // TODO: implement getClip
    //  throw UnimplementedError();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
*/



import 'package:cache_image/cache_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material/provider/provider.dart';
import 'package:provider/provider.dart';

class PageProviderTest extends StatefulWidget {
  @override
  _PageProviderTestState createState() => _PageProviderTestState();
}

class _PageProviderTestState extends State<PageProviderTest> {
  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of<MyProvider>(context ,listen: false) ;

    return Scaffold(
      appBar: AppBar(title: Text('provider Page'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CacheImage(
                    'https://my.te.eg/assets/te-theme/images/svgfallback/logo-ar.png' ,

                  ),
                )
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Selector<MyProvider ,int>(
                  selector: (context ,varName)=> varName.getCount1(),

                  builder: (context ,consumerBloc ,widget) {
                    print('Selector__1');
                    return Text('$consumerBloc');
                    },
                ),

                Selector<MyProvider ,int>(
                  selector: (context ,varName2)=> varName2.getCount2(),

                  builder: (context ,consumerBloc2 ,widget) {
                    print('Selector__2');
                    return Text('$consumerBloc2');
                  },
                ),

              ],
            ),

            Consumer<MyProvider>(
              builder: (context ,consumerBloc ,widget)=> Text('${consumerBloc.myDateTime}'),
            ),


          ],
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          Consumer<MyProvider>(
            builder: (context ,consumerBloc ,child)=> FloatingActionButton(
              heroTag: 'A',
              child: Icon(Icons.add),
              onPressed: (){
                consumerBloc.incrementCount();
              },
            ),
          ),

          Consumer<MyProvider>(
            builder: (context ,consumerBloc ,widget)=> FloatingActionButton(
              heroTag: 'B',
              child: Icon(Icons.add),
              onPressed: (){
                consumerBloc.incrementCount2();
              },
            ),
          ),

        ],
      ),


    );
  }
}

