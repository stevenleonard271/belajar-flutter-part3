import 'package:flutter/material.dart';
import 'package:provided_state_management/application_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => ApplicationColor(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Center(
                child: Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => Text(
                    'Provide State Management',
                    style:
                        TextStyle(fontSize: 20, color: applicationColor.color),
                  ),
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, child) =>
                        AnimatedContainer(
                      width: 100,
                      height: 100,
                      duration: Duration(milliseconds: 500),
                      color: applicationColor.color,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text('LB'),
                        margin: EdgeInsets.all(5),
                      ),
                      Consumer<ApplicationColor>(
                          builder: (context, applicationColor, child) => Switch(
                              value: applicationColor.isLightBlue,
                              onChanged: (newValue) {
                                applicationColor.isLightBlue = newValue;
                              })),
                      Container(
                        child: Text('AB'),
                        margin: EdgeInsets.all(5),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
