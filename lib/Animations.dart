import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> with TickerProviderStateMixin{
  bool animated = false ;
  @override
  void initState() {
    Timer(Duration(seconds: 0) ,(){
      setState(()=> animated=true);
    });

    myAnimationController = AnimationController(vsync: this ,duration: Duration(seconds: 3) ,lowerBound: 0 ,upperBound: 35 ,);
    myAnimationController.forward();
    myAnimationController.addListener((){setState((){});});
    super.initState();
  }
  AnimationController myAnimationController;
  @override
  void dispose() {
    myAnimationController.dispose();
    super.dispose();
  }



  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool animat = false ;

  double screenWidth ()=>MediaQuery.of(context).size.width ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          AnimatedAlign(
            duration: Duration(seconds: 1),
            alignment: animat==false ? Alignment.topCenter : Alignment.center,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                color: animat==false ? Colors.deepPurple : Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(animat==false ? 0 : 20,),
                border: Border.all(width: animat==false ? 0 : 5,color: Colors.red),
                boxShadow: [BoxShadow(spreadRadius: animat==false ? 5 : 15,blurRadius: 10)],
              ),
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                switchOutCurve: Curves.easeInOutCubic,
                switchInCurve: Curves.fastLinearToSlowEaseIn,
                transitionBuilder: (child ,animation) =>
                    ScaleTransition(
                      child: child,
                      scale: animation,
                    ),
                child: animat==false ? Icon(Icons.android ,color: Colors.white ,) : Text('Hello Bro'),
              ),
              width: 200,height: 75,
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              child: Text('Animation'),
              onPressed: (){
                setState((){
                  animat = animat==false ? true :false;
                });
              },
            ),
          ),


          Align(
            alignment: Alignment.center,
            child: Container(
              height: screenWidth() *0.5,width: screenWidth()*0.8,
              color: Colors.grey[400],
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    height: screenWidth() *0.5,width: screenWidth()*0.8,
                    right: openListAnimated==false ?  0 : screenWidth()*0.8,
                    duration: Duration(seconds: 1),
                    child: threeButtons(),
                  ),

                  AnimatedPositioned(
                    height: screenWidth()*0.5,width:screenWidth()*0.8,
                    right: openListAnimated==false ?  -screenWidth()*0.8 : 0,
                    duration: Duration(seconds: 1),
                    child: subSetListOpened(),
                  ),
                  openListAnimated == false ? SizedBox()
                      : Align(alignment: Alignment.centerRight ,child: shadowScroll())
                ],
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              child: Text('Hello bro i\'m Animateion' ,style: TextStyle(fontSize: myAnimationController.value),),
            ),
          ),
          
          
        ],
      ),
    );
  }

  bool openListAnimated = false ;
  List iconsButtons = [Icons.android ,Icons.tv ,Icons.access_time ,Icons.print ,Icons.weekend , Icons.tag_faces, Icons.refresh ,Icons.voicemail ,Icons.code];
  threeButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        margin:  EdgeInsets.all(8),
        child: IconButton(
          icon: Icon(iconsButtons[index]),
          onPressed: (){
            setState(()=> openListAnimated=openListAnimated==true ? false : true);
          },),
      ))
    );
  }

  //myScrollController.offset<=10 ? SizedBox()
  subSetListOpened(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(10, (index){
          return Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              padding: EdgeInsets.all(3),
              margin:  EdgeInsets.all(5),
              child: index==0 ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  setState(()=> openListAnimated=false);
                },)
                  :IconButton(
                icon: Icon(iconsButtons[index-1]),
                onPressed: (){

                },)
          );
        }),
      ),
    );
  }
shadowScroll(){
    return Container(
      height: 40,width: 1,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.white ,blurRadius: 20 ,spreadRadius: 15)],
        color: Colors.black,
      ),
    );
}
}
