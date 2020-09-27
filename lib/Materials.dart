import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material/El_Code.dart';
import 'package:material/designWelcomPage.dart';
import 'package:material/provider/pageProvider.dart';
import 'package:random_color/random_color.dart';

import 'Animations.dart';
import 'Counter.dart';
import 'Tabs.dart';
import 'deviceInfo.dart';
import 'location.dart';
import 'bottomSheet.dart';

class Materials extends StatefulWidget {
  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {



  final formKey = GlobalKey<FormState>();
  var formValue ;
  bool myFirstFocus = true ;
  bool mySecondFocus = false ;

  bool switchValue = false ;

  Color valueVar = Colors.greenAccent;
  Color RadioChangeColor = Colors.greenAccent ;


  int _initialValue = 0;

//this function to generate 50 random color ... and it color static until not hot reStart
  // to use it => myColor(); .... for(j)=> color: StaticColors[j] ;

  static List<Color> ClrStorage = [];

  static generateRandomColors() {
    if (!isRandom) {
      for (int i = 0; i < 50; i++) {
        RandomColor _randomColor = RandomColor();
        Color _color = _randomColor.randomColor();
        ClrStorage.add(_color);
      }
    }
  }
  static bool isRandom = false;

  final List<Color> StaticColors = ClrStorage;

  bool isPressed = false ;
  savedpost_SnackBar() {
    return Builder(builder: (context) {
      return FlatButton(
        child: isPressed==false ? Icon(Icons.bookmark_border) : Icon(Icons.bookmark , color: Colors.blue,),
        onPressed: () {
          setState(() {
            if(isPressed==true){
              setState(() => isPressed = false);
              print("un saved");
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("un saved"),
              ));
            }
            else isPressed=true;
          });
          print('isPresseed =  $isPressed');
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("post is Saved"),
            behavior: SnackBarBehavior.floating,
            onVisible: () => print('object'),
            elevation: 20,
            action: SnackBarAction(
              label: 'undo',
              textColor: Colors.deepOrangeAccent,
              onPressed: () {
                setState(() => isPressed = false);
                print("un saved");
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("un saved"),
                ));
              },
            ),
          ));
        },
      );
    });
  }


  @override
  void initState() {
    generateRandomColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Material' ,style: TextStyle(fontSize: 30),),
          ),
          SliverList(
            delegate: SliverChildListDelegate([

              appCard(title: 'SnackBar' ,page: null ,index: 0 ,isPage: false),
              appCard(title: 'PopUp Menu' ,page: null ,index: 1 ,isPage: false),
              appCard(title: 'Device Informatios' ,page: DeviceInfo() ,index: 2,isPage: true),
              appCard(title: 'El Code' ,page: El_Code() ,index: 3,isPage: true),
              appCard(title: 'Split Image' ,page: SplitImage() ,index: 4,isPage: true),
              appCard(title: 'Bottom Sheet' ,page: BottomSHTest() ,index: 5,isPage: true),
              appCard(title: 'Location' ,page: Get_Location() ,index: 6,isPage: true),
              appCard(title: 'Counter' ,page: CountDown() ,index: 7,isPage: true),
              appCard(title: 'Welcom Page' ,page: DesignWelcomPage() ,index: 8,isPage: true),
              appCard(title: 'Animations' ,page: AnimationTest() ,index: 9,isPage: true),
              appCard(title: 'providerTest' ,page: PageProviderTest() ,index: 10,isPage: true),


              Container(
                child: dropdownButton(),
                color: Colors.tealAccent,
              ),

              Container(
                child: SliderTest(),
                color: Colors.deepPurpleAccent,
              ),

              Container(
                  width: 300,
                  height: 100,
                  color: valueVar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        //title: Text('Chose'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.black,
                        value: Colors.greenAccent,
                        groupValue: valueVar,
                        onChanged: (value){
                          setState(() => valueVar = value);
                        },
                      ),
                      Text("Green"),
                      Radio(
                        //title: Text('Chose'),
                        activeColor: Colors.black,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: Colors.lightGreenAccent,
                        groupValue: valueVar,
                        onChanged: (value){
                          setState(() => valueVar = value);
                        },
                      ),
                      Text("Yellow"),
                      Radio(
                        //title: Text('Chose'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.black,
                        value: Colors.lightBlueAccent[200],
                        groupValue: valueVar,
                        onChanged: (value){
                          setState(() => valueVar = value);
                        },
                      ),
                      Text("Blue"),
                    ],
                  )
              ),

              Container(
                child: TabTest(),
                color: Colors.lightBlueAccent[100],
              ),

              Container(
                width: 100,color: Colors.black87,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Switch(
                      value: switchValue ,
                      onChanged: (x) =>setState(() =>switchValue = x),
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      activeThumbImage: AssetImage('Apps_Icons/facebook.png'),
                      inactiveThumbImage: AssetImage('Apps_Icons/whattsapp.png'),
                      activeTrackColor: Colors.blue[400],
                      inactiveTrackColor: Colors.green[400],
                    ),
                  ],
                ),
              ),

              Container(
                child: MyBorder(),
                height: MediaQuery.of(context).size.width*0.7,
              ),



            ]),
          )
        ],
      ),
    );
  }
  appCard({String title ,var page  ,bool isPage ,int index}){
    return Card(
      child: ListTile(
        title: Text(title,),
        leading: Icon(Icons.monetization_on, color: StaticColors[index], size: 30,),
        trailing: index==0 ? savedpost_SnackBar() : index==1 ? popupMenu() : Text('$index'),
        onTap: () {
          isPage==false ? page :
          Navigator.of(context).push(CupertinoPageRoute(
            builder: (context)=>page
          ));
        },
      ),
    );
  }

  List<int> allStrings = [1, 2, 3, 4];
  popupMenu(){
    return Builder(
      builder: (context) {
        return PopupMenuButton(
          initialValue: _initialValue,
          tooltip: 'Select',
          color: Colors.black54,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          onCanceled: () {
            return _initialValue == 0
                ? Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30))),
                content: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.error,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Error :   must select just one',
                    ),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            )
                : null;
          },
          onSelected: (choice) {
            print(choice);
            if (choice == _initialValue) {
              setState(() {
                _initialValue = 0;
              });
            } else {
              setState(() {
                _initialValue = choice;
              });
            }
            return Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 1),
                content: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.thumb_up),
                    ),
                    Text(
                      'Saved To :  ${choice.toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                backgroundColor: Colors.black54,
              ),
            );
          },
          itemBuilder: (context) {
            return allStrings.map((choice) {
              return PopupMenuItem(
                value: choice,
                child: Center(
                    child: Text(
                      choice.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              );
            }).toList();
          },
        );
      },
    );
  }


  static List myChoiseForDowenMenu = ['Dart' , 'Java' ,'JavaScript' , 'Not Lang Selected'];
  var menuLable = myChoiseForDowenMenu[3];
  dropdownButton(){
    return  Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: DropdownButton(
          items: myChoiseForDowenMenu.map((x){
            return DropdownMenuItem(
              child: Text(x) , value:  x,
            );
          }).toList(),
          onChanged: (change){
            setState(()=> menuLable = change);
          },
          isDense: true,
          elevation: 10,
          iconSize: 40,
          value: menuLable,
          iconDisabledColor: Colors.red,
          iconEnabledColor: Colors.cyan,
          //itemHeight: 150,
          underline: Container(height: 5,color: Colors.red,),

        ),
      ),
    );
  }

}


class SplitImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Image(image: AssetImage('images/splitImage_1.png'),fit: BoxFit.fitWidth,),
            Image(image: AssetImage('images/splitImage_2.png'),fit: BoxFit.fitWidth,),
            Image(image: AssetImage('images/splitImage_3.jpg'),fit: BoxFit.fitWidth,),
          ],
        ),
      ),
    );
  }
}



class MyBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth ()=> MediaQuery.of(context).size.width ;
    Widget myContainer (_decoration ,{isChild=false})=> Container(
      width: isChild ? screenWidth()*0.6 : screenWidth()*0.7,
      height: isChild ? screenWidth()*0.4 : screenWidth()*0.5,
      decoration: _decoration,
    );
    BorderSide myBorderSide ([_color=Colors.black])=> BorderSide(color: _color, width: 4) ;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            myContainer(
                BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    border: Border.fromBorderSide(myBorderSide(Colors.redAccent)),
                    image: DecorationImage(
                      image: AssetImage('images/spongeBob.3.jpg') ,fit: BoxFit.cover
                    )
                )
            ),
            Positioned(
              top: 0,left: 0,
              child: myContainer(
                  BoxDecoration(
                      border: Border(top: myBorderSide() ,left:  myBorderSide()))
                  ,isChild: true
              ),
            ),
            Positioned(
              bottom: 0,right: 0,
              child: myContainer(
                  BoxDecoration(
                      border: Border(bottom: myBorderSide() ,right:  myBorderSide()))
                  ,isChild: true
              ),
            ),
          ],
        ),
      ),
    );
  }
}

