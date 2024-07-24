import 'package:flutter/material.dart';
import 'package:flutter_project1/api%20practice/screen/home/widget/usertile.dart';
import 'package:get/get.dart';

import '../../controller/usercontroller.dart';



void main(){
  runApp(GetMaterialApp(home: UserHome(),));
}

class UserHome extends StatelessWidget {
  final UserContoller userobj= Get.put(UserContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Home'),),
      body: SizedBox(child: Obx(() {
        if(userobj.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index){

            return UserTile(userobj.userList[index]);

              });
        }
      }),),
    );
  }
}
