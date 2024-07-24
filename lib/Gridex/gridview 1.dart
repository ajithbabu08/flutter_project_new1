import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: GridView1(),));
}
class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My GridView"),),
      body: GridView(gridDelegate:
      // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 80),
      children: List.generate(15, (index) => Card(
        color: Colors.red,
        child: Center(
          child: Icon(Icons.ac_unit_rounded),
        ),
      ))),
    );
  }
}
