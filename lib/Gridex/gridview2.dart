import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: GridView2(),));
}

class GridView2 extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View 2"),),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 15,
          itemBuilder: (context,index){
        return Card(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Item"),
                Icon(Icons.add_chart)
              ],
            ),
          ),
        );
          }),
    );
  }
}
