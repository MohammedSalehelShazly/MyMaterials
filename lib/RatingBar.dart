import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  RatingBar(int startCount);

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  @override
  //count not used in itemBuilder ... if it used is not true.............

  static Map<int, Color> all = {
    1: Colors.white30,
    2: Colors.white30,
    3: Colors.white30,
    4: Colors.white30,
    5: Colors.white30,
  };
  double _start_size = 25.0;
  List<Color> startColor = (all.values).toList();

  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      child: ListView.builder(
          itemExtent: _start_size + 2,
          scrollDirection: Axis.horizontal,
          itemCount: startColor.length,
          itemBuilder: (context, count) {
            return IconButton(
              icon:
              Icon(Icons.star, color: startColor[count], size: _start_size),
              onPressed: () {
                setState(() {
                  if (startColor[count] == Colors.white30) {
                    startColor[count] = Colors.yellowAccent;
                    for (int i = count; i >= 0; i--) {
                      startColor[i] = Colors.yellowAccent;
                    }
                  } else {
                    for (int j = count + 1; j < startColor.length; j++) {
                      startColor[j] = Colors.white30;
                    }
                  }
                  print(count + 1);
                });
              },
            );
          }),
    );
  }
}
