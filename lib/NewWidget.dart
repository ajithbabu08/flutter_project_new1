
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NewWidget extends StatelessWidget {
  final ImageProvider myimage;
  final String name;
  final String price;

  NewWidget({super.key,required this.myimage,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: myimage,width: 100,height: 100,),
          Text(name),
          Text(price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(onPressed: (){}, icon: Icon(CupertinoIcons.add), label: Text("Add")),
              ElevatedButton.icon(onPressed: (){}, icon: Icon(CupertinoIcons.heart_fill), label: Text("Favourite")),
            ],
          )
        ],
      ),
    );
  }
}
