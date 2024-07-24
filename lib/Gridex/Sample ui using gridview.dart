import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: SampleGrid(),));
}
class SampleGrid extends StatelessWidget {

  var images=["assets/images/yellowbackgroundapp.jpg","assets/images/appback.jpg",
    "assets/images/yellowbackgroundapp.jpg","assets/images/appback.jpg",
    "assets/images/yellowbackgroundapp.jpg","assets/images/appback.jpg"];


  // var color=[Colors.green,Colors.yellowAccent,Colors.red,Colors.cyan,Colors.pink,Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5),
          itemBuilder: (context,index){
        return Container(
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            // color: color[index]
              image: DecorationImage(
              image: AssetImage(images[index])
          // ),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.ac_unit),
          //     SizedBox(width: 15,),

            // ],
          ),
          child: Text("Hello"),
        );
          },
      itemCount: 6,
      ),
    );
  }
}
