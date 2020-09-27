import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material/Animations.dart';
import 'package:material/Materials.dart';
import 'package:material/designWelcomPage.dart';
import 'package:material/provider/provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (_)=> MyProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Material',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Materials()
      ),
    );
  }
}


class TestMaterialSaved extends StatefulWidget {
  @override
  _TestMaterialSavedState createState() => _TestMaterialSavedState();
}

class _TestMaterialSavedState extends State<TestMaterialSaved> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(actions: <Widget>[TextField()],),
      resizeToAvoidBottomPadding: false,
      body: Center(

      )
    );
  }
}

