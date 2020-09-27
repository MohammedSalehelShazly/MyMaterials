import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountDown extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {

  var _countDownController = CountdownController();

  String _Counter = '20' ;

  bool _isPause = false;
  String timerTitle = 'pause' ;
  Color borderWTitleColor = Colors.lightBlue ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Count Down" , style: TextStyle(fontSize: 40 , color: borderWTitleColor==Colors.lightBlue ? Colors.red : Colors.lightBlue),),
            Container(
              width: MediaQuery.of(context).size.width *0.7,
              height: MediaQuery.of(context).size.width *0.7,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderWTitleColor , width: 5)
              ),
              child: Countdown(
                seconds: int.parse(_Counter)+5 ,
                build: (BuildContext context,time){
                  return Center(
                    child: Text(
                      '00 : '
                          '${time >=10 ? time.toInt().toString() : "0"+time.toInt().toString()}'
                          ' : 00' ,

                      style: TextStyle(fontSize: 40 , color: borderWTitleColor),
                    ),
                  );
                },
                interval: Duration(seconds: 1),
                onFinished: () {
                  print('Timer is done!');
                  setState(() => borderWTitleColor = Colors.red);
                },
                controller: _countDownController,
              ),
            ),
            OutlineButton(
              splashColor: Colors.lightBlue,
              child: Text(timerTitle),
              onPressed: (){
                setState(() {
                  if(_isPause==false){
                    _countDownController.pause();
                    _isPause = true ;
                    timerTitle ="resume";
                    borderWTitleColor = Colors.red;
                  }
                  else{
                    _countDownController.resume() ;
                    _isPause = false ;
                    timerTitle = "pause" ;
                    borderWTitleColor = Colors.lightBlue;
                  }
                });
              },
            ),
            OutlineButton(
              onPressed: (){
                setState(() {
                  _countDownController.restart() ;
                  timerTitle ="pause";
                  borderWTitleColor = Colors.lightBlue ;
                });
              },
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    ) ;
  }
}