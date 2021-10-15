import 'package:doc_comment/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserProfile profile = UserProfile(
    name: "Tony Stark",
    role: "Iron Man",
    photoUrl: "https://lalala.com/foto.png",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Doc Comment Example'),
      ),
      body: Center(
        child: profile,
      ),
    ));
  }
}
