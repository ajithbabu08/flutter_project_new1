
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/splash.dart';
import 'package:flutter_project1/splash2.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main(){
  runApp(MaterialApp(home: IntroScreen(),));
}

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    PageDecoration pageDecoration= PageDecoration(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w900,
          fontSize: 40,
          color: Colors.yellow),

      boxDecoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.grey,
          Colors.white38,
        ],
        begin: Alignment.bottomLeft,
          end: Alignment.topLeft)
      )
    );
    return IntroductionScreen(
    pages:[
      PageViewModel(
        decoration: pageDecoration,
    title: "First Page",
    body: "Introduction screen showing app demo page details",
    image: IntroImage("https://images.unsplash.com/photo-1682685797828-d3b2561deef4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80")
    ),

    PageViewModel(
    title: "Second page",
    body: "Introduction screen showing app demo page details",
    image: IntroImage("https://images.unsplash.com/photo-1502989642968-94fbdc9eace4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDY1OTc2fHxlbnwwfHx8fHw%3D&w=1000&q=80")
    ),

    PageViewModel(
    title: "Third Page",
    body: "Introduction screen showing app demo page details",
    image: IntroImage("https://images.unsplash.com/photo-1692684583465-6230fa0ccb1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80")
    ),

    ],

    onDone: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MysplashPage())),
    onSkip: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Splash2())),
showSkipButton: true,
skip: Text("Skip"),
next: Icon(Icons.arrow_forward_rounded),
done: Text("Done"),
dotsDecorator: DotsDecorator(
size: Size(25, 12),
color: Colors.grey,
activeSize: Size(25, 12),
activeColor: Colors.yellow,
activeShape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(20))
)
),
    );
  }
  Widget IntroImage(String image){
    return Container(
      height: 700,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
       fit: BoxFit.cover,
      image: NetworkImage(image),))
    );
}
}
