import 'package:flutter/material.dart';
import 'package:flutter_project1/api%20practice/model/userdemo.dart';

class UserTile extends StatelessWidget {
  final UserData user;
  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(user.name!),
          Text(user.email!),
          Text(user.phone!)
        ],
      ),
    );
  }
}

