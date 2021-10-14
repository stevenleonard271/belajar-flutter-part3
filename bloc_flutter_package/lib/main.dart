import 'package:flutter/material.dart';
import 'color_bloc.dart';
import 'main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
       create:  (context) => ColorBloc(), child: MainPage()),
    );
  }
}
