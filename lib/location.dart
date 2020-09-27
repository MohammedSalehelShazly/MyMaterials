import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Get_Location extends StatefulWidget {
  @override
  _Get_LocationState createState() => _Get_LocationState();
}
class _Get_LocationState extends State<Get_Location> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _location();
    });
    super.initState();
  }

  Position position;
  double lat = 0, long = 0 ;
  _location()async {
    this.position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    this.lat = position.latitude;
    this.long = position.longitude;
  }
  Color clr1 = Colors.white;
  int my_test_routeing = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: (MediaQuery
                  .of(context)
                  .size
                  .width / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(offset: Offset(15, 15),
                        color: Colors.black12,
                        blurRadius: 3,
                        spreadRadius: 10)
                  ]
              ),
            ),
            RaisedButton(
              child: Text(
                "GPS", style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  _location();
                  print("\n preased GPS Now is ......$position");
                });
              },
            ),
            Transform.translate(
              offset: Offset(0,35),
              child: SelectableText(
                "${lat.toString()} , ${long.toString()}",
                style: TextStyle(fontSize: 20 , ),
                showCursor: true,
                cursorColor: Colors.red,
              ),
            ),

//            Transform.translate(
//              offset: Offset(0,200),
//              child: InkWell(
//                onTap: (){
//                  Navigator.of(context).push(MaterialPageRoute(
//                    builder:(context)=>SecondPageRoute()
//                  ));
//                },
//                child: Container(
//                  child: Text("Hello" , style: TextStyle(color: Colors.black, fontSize: 30),),
//                ),
//              ),
//            ),


          ],
        ),
      ),
    );
  }


}