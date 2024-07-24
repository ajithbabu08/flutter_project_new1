import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main(){
  runApp(MaterialApp(home: RiveEx(),));
}

class RiveEx extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: RiveAnimation.asset("assets/anim/dancing.riv"),
      ),
    );
  }
}
