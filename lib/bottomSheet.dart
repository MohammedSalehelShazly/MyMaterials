import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material/provider/provider.dart';
import 'package:provider/provider.dart';

class BottomSHTest extends StatefulWidget {
  @override
  _BottomSHTestState createState() => _BottomSHTestState();
}

class _BottomSHTestState extends State<BottomSHTest> with SingleTickerProviderStateMixin{
  Tween <Offset>_tween = Tween(begin: Offset(0,1) ,end: Offset(0,0));
  AnimationController _controller ;
  @override
  void initState() {
    setState(() {
      _controller = AnimationController(vsync: this ,duration: Duration(seconds: 1));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final bloc2 = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
            child: Text('DraggScrollSheet'),
            color: Colors.cyanAccent,
            onPressed: (){
              _controller.isDismissed ? _controller.forward() : _controller.reverse();
            },
          ),

          RaisedButton(
            child: Text("Cupertino date Picker",),
            color: Colors.greenAccent,
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                  context: context,
                  builder: (builder) {
                    return Container(
                      height: MediaQuery.of(context).size.height *0.3,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height *0.04,
                            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30)),color: Colors.purpleAccent),
                            child: Divider(thickness: MediaQuery.of(context).size.height *0.005,indent: MediaQuery.of(context).size.height *0.15,endIndent: MediaQuery.of(context).size.height *0.15,color: Colors.black54,),
                          ),
                          Expanded(
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (selectedDateTime){
                                bloc2.myDateTime = selectedDateTime ;
                              },
                              initialDateTime: bloc2.myDateTime ,
                              mode: CupertinoDatePickerMode.time,backgroundColor: Colors.purpleAccent[100],

                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),

          Container(
            height: MediaQuery.of(context).size.height*0.6, // cause appBar is large and button make size
            child: showBottomSheet(),
          )

        ],
      ),
    );
  }
  showBottomSheet(){
    return SlideTransition(
      position: _tween.animate(_controller),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context ,scrollController)=> Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30)) ,color: Color(0xff440047).withOpacity(0.9),),
                child: Icon(Icons.android ,size: MediaQuery.of(context).size.width/2,color: Colors.green,)
            ),
          ),
        ),
      ),
    );
  }

}
