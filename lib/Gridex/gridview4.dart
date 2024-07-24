import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: GridView4(),));
}
class GridView4 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View 4"),),
      body: GridView.extent(maxCrossAxisExtent: 5,
      children: List.generate(20, (index) => Card(
        color: Colors.green,
        child: Center(
          child: Text("Hello"),
        )
      )),),

    );
  }
}
