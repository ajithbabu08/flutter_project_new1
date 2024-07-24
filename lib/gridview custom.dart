import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: GridCustom(),));
}
class GridCustom extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView.Custom"),
      ),
      body: GridView.custom(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          childrenDelegate: SliverChildListDelegate(
        List.generate(12, (index) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/yellowbackgroundapp.jpg")
                      ),
                    ),
                  ),
                  Text("Item.1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("\$ 200",style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
        )),
      )),
    );
  }
}
