import 'dart:math';
import 'package:flutter/material.dart';

class El_Code extends StatefulWidget {
  @override
  _El_CodeState createState() => _El_CodeState();
}
class _El_CodeState extends State<El_Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: ListView(
        children: List.generate(20, (index) => BodyCode(index)),
      ),
    );
  }
}

class BodyCode extends StatefulWidget {

  int index ;
  BodyCode(this.index);

  @override
  _BodyCodeState createState() => _BodyCodeState();
}
class _BodyCodeState extends State<BodyCode> {
  bool add = false ;
  double screenHeight ([ratio=1])=> MediaQuery.of(context).size.height*ratio;
  int subChildCount = Random().nextInt(5)+1 ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Text('${widget.index}'),
            title: Text('Open The List'),
            onTap: (){
              setState(() {
                add = !add ? true : false ;
                print(subChildCount);
              });
            },
          ),
        ),

        add==false ? SizedBox() :
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight(1/11*subChildCount) ,maxWidth: MediaQuery.of(context).size.width*0.97),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(subChildCount, (parentIndex) => Card(
              color: Colors.yellowAccent,
              child: ListTile(
                leading: Text('#$parentIndex'),
                title: Text('parent'),
              ),
            ),)
          ),
        )

      ],
    );
  }
}