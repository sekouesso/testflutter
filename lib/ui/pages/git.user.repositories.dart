import 'package:flutter/material.dart';
import 'package:testflutter/model/users.model.dart';
class GitRepositories extends StatelessWidget {
  final User user;
  const GitRepositories({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('User ${user.login} repositories'),
     ),
     body: Container(),
    );
  }
}
