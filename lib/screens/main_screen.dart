import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/horz_layout.dart';
import '../widgets/vert_layout.dart';

class SolveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // If the width is greater than 400px the phone can rotate
    var _shortestSide = MediaQuery.of(context).size.width;
    var _canRotate = _shortestSide > 400;
    if (_canRotate == false) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[300],
        title: Title(color:Colors.white, child:Align(
          alignment: Alignment.center,
          child:Text('Sudoku Solver',style: TextStyle(fontSize: 30),))),
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return VerticalLayout();
            } else {
              return HorizontalLayout();
            }
          },
        ),
      ),
    );
  }
}
