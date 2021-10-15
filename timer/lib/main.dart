import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStop = true;
  bool isBlack = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  color: (isBlack) ? Colors.black : Colors.purple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  Timer(Duration(seconds: 5), () {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
                child: Text('Ubah warna 5 detik kemudian'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
                child: Text('Ubah warna secara langsung'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  counter = 0;
                  isStop = false;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (isStop) timer.cancel();
                    setState(() {
                      counter++;
                    });
                  });
                },
                child: Text('Start Timer'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  isStop = true;
                },
                child: Text('Stop Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
