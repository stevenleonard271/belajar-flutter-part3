import 'package:custom_progress_bar/custom_progress_bar.dart';
import 'package:custom_progress_bar/time_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Progress Bar'),
        ),
        body: Center(
          child: ChangeNotifierProvider(
            create: (context) => TimeState(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<TimeState>(
                  builder: (context, timeState, _) => CustomProgressBar(
                    width: 200,
                    value: timeState.time,
                    totalValue: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Consumer<TimeState>(
                  builder: (context, timeState, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Timer.periodic(Duration(milliseconds: 500), (timer) {
                            if (timeState.time == 0)
                              timer.cancel();
                            else
                              timeState.time -= 1;
                          });
                        },
                        color: Colors.blue,
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      RaisedButton(
                        onPressed: () {
                          timeState.time = 15;
                        },
                        color: Colors.red,
                        child: Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
