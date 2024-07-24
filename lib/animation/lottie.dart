import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(home: LottieAnim(),));
}
class LottieAnim extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("lottie"),),
      body: ListView(
        children: [
          Lottie.asset("assets/anim/batmananim.json")

        ],
      ),
    );
  }
}
