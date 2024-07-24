import 'package:flutter/material.dart';

class GridAssignment extends StatelessWidget {

  var icons=[""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View"),),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 2),
          itemBuilder: (context,index)=>Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: cardContent[index][2]),

            ),
          )),
    );
  }
}
