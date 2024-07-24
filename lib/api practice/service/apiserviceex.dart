import 'package:flutter_project1/api%20practice/model/userdemo.dart';
import 'package:http/http.dart'as http;

class UserHttp{

  static Future<List<UserData>> fetchUser() async{
    var response= await http.get(Uri.parse("https://fakestoreapi.com/users"));
    if(response.statusCode ==200){
      var data=response.body;
      return userDataFromJson(data);
    }else{
      throw Exception();
    }
  }
}