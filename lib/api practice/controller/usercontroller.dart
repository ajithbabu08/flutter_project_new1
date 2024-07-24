import 'package:flutter_project1/api%20practice/service/apiserviceex.dart';
import 'package:get/get.dart';

class UserContoller extends GetxController{

  var isLoading= true.obs;
  var userList=[].obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  void getUserDetails() async{
    try{

      isLoading(true);
      var products= await UserHttp.fetchUser();
      if(products !=null){
        userList.value= products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}