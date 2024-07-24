import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'hometodo.dart';


void main()async{
  await Hive.initFlutter();
  await Hive.openBox("todo_app_box");
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: AppSplash(),));
}


class AppSplash extends StatefulWidget {


  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {

  @override
  void initState() {
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>HomeTodoApp()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(color: Colors.black,
      child: Center(
      child: Text("Trace Span",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
      fontSize: 25),),
      ),
    ),
    );
  }
}
