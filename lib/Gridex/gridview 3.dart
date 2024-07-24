import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Gridview3(),));
}
class Gridview3 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View 3"),),
      body: GridView.count(
        crossAxisCount: 4,
      children: List.generate(15, (index) => Card(
        color: Colors.orange,
            child: Center(
              child: Text("Hey"),
            ),
          )),),
    );
  }
}
