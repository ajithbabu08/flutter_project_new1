import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Splash2()));
}
class Splash2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      ///set background color way 1
      //  backgroundColor : Colors.blue,
      body: Container(

        ///set background color way 2 using gradient inside container
        decoration: const BoxDecoration(
            
            // gradient: LinearGradient(
            //  begin: Alignment.bottomCenter,
            // end:Alignment.centerLeft,
            // colors: [Colors.white,Colors.yellow])

          ///set background way 3 using image
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage("assets/images/yellowbackgroundapp.jpg"))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Icon(Icons.flash_on,
              // size:50,
              // color: Colors.blue,),

              Image.asset("assets/icons/flashicon.png",
              height: 100,
              width: 100,),

              const Text("Let's Go",style:TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                 color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}