import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "No Name");
  bool isON;

  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("nama", controller.text);
    preferences.setBool("value", isON);
  }

  Future<String> getNama() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("nama") ?? " No Name";
  }

  Future<bool> getON() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("value") ?? "No Value";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
          ),
          Switch(
            value: isON,
            onChanged: (newValue) {
              setState(() {
                isON = newValue;
              });
            },
          ),
          RaisedButton(
            onPressed: () {
              saveData();
            },
            child: Text('Save'),
          ),
          RaisedButton(
            onPressed: () {
              getNama().then((s) {
                controller.text = s;
                setState(() {});
              });

              getON().then((b) {
                isON = b;
                setState(() {
                  
                });
              });
            },
            child: Text('Load'),
          )
        ],
      )),
    ));
  }
}
