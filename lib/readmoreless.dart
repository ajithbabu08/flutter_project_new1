import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main(){
  runApp(MaterialApp(home: ReadMoreLess(),));
}

class ReadMoreLess extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read More & Read Less"),
      ),
      body: Column(
        children: [
          ReadMoreText("On September 8th, 2021, Dart 2.14 and Flutter 2.5 were released by Google. The update brought improvements to the Android full-screen mode and the latest version of Google's Material Design called Material You. Dart received two new updates, standardizing lint conditions and marking support for Apple Silicon as stable",
          trimLines: 1,
          preDataText: "Flutter",
          preDataTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
            trimMode: TrimMode.Line,
            trimCollapsedText: "expand",
            trimExpandedText: "...less",

          )
        ],
      ),
    );
  }
}
