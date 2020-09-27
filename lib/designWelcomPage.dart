import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesignWelcomPage extends StatefulWidget {
  @override
  _DesignWelcomPageState createState() => _DesignWelcomPageState();
}

class _DesignWelcomPageState extends State<DesignWelcomPage> {

  Color c1 = Colors.white;
  int fontSize = 35;
  String background = "images/landscape.jpg";
  int btomNavBarIndex = 0;

  String nameRegister ;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(
          child: Text(
            "What's Now?".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.textScaleFactorOf(context)* 28,
                letterSpacing: 1,
                wordSpacing: 10),
          ),
        ),

        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Open Menu',
            onPressed: ()=> scaffoldKey.currentState.openDrawer()
        ),

      ),
      drawer: SafeArea(
        child: wlcomDrawer(),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("images/elSHafaq_elA7mar.jpg"), fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 100.0, left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("Welcome !!", style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*40, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height/75,),

                  Container(
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.red, blurRadius: 30,)],),
                    child: Text(
                      "Making Frindes Is Easy as Waving Your Hand Right and Left",
                      style: TextStyle(color: Colors.white ,fontSize: MediaQuery.textScaleFactorOf(context)*15) ,textAlign: TextAlign.center,),
                  ),
                  Transform.translate(
                    offset: Offset(0, 30),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20) ,
                          boxShadow: [BoxShadow(color: Colors.red, blurRadius: 50,spreadRadius: -20)],),
                        height: MediaQuery.of(context).size.height/8,
                        child: myPageView()
                    ),
                  ),
                  /// tabs indecator
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoButton(
                  child: Text("Get Started".toUpperCase(), style: TextStyle(color: Colors.white, letterSpacing: 1),),
                  color: Colors.red[900],
                  onPressed:() {}
              ),
            ),
          ],
        ),
      ),
    );
  }
  myPageView(){
    return PageView(
      controller: PageController(
        initialPage: 0,
        keepPage: true,
      ),
      children: <Widget>[pageOfPageView(0), pageOfPageView(1), pageOfPageView(2)],
      pageSnapping: false,
      physics: BouncingScrollPhysics(),
    );
  }
  List<IconData> myIcons = [Icons.code , Icons.android , Icons.all_inclusive];
  pageOfPageView(i)=> Icon(myIcons[i],size: MediaQuery.of(context).size.height/10,color: Colors.white.withOpacity(0.8),);

  wlcomDrawer(){
    return  Container(
      height: MediaQuery.of(context).size.height*0.95,
      width: MediaQuery.of(context).size.width*0.7,
      child: Container(
          padding: EdgeInsets.fromLTRB(0,3,3,3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(50),),
            color: Colors.white70,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(50),),
              color: Colors.black87,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    drawerCard('Explor', context , hasNotfi: 2),
                    drawerCard('Headline News', context),
                    drawerCard('Rate Later', context),
                    drawerCard('Videos', context),
                    drawerCard('Photos', context),
                    drawerCard('Settings', context),
                  ],
                ),
              ],
            ),
          )),
    );
  }
  BorderSide drawerBorderSide = BorderSide(width: 3 , color: Colors.white) ;
  drawerCard(_title , _context ,{hasNotfi = false}){
    return ListTile(
      leading: Text(_title , style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(_context)*22 , color: Colors.white),),
      dense: true,
      title: hasNotfi !=false ?
      CircleAvatar(
        child: Text("2"),
        backgroundColor: Colors.red,
        radius: MediaQuery.of(_context).size.width/35,
      ):Text('') ,
      trailing: IconButton(
        icon :Icon( Icons.arrow_forward_ios , size: MediaQuery.of(_context).size.width/20,color: Colors.white,),
        onPressed: ()=> null,
      ),
    );
  }
}