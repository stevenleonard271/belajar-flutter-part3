import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'money.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
          ChangeNotifierProvider<Money>(create: (context) => Money())
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if(money.balance>=500){
                  money.balance -= 500;
                  cart.quantity += 1;
                }},
                child: Icon(Icons.add_shopping_cart),
              ),
            ),
          ),
          appBar: AppBar(
            title: Center(child: Text('Multi Provider')),
            backgroundColor: Colors.purple,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Balance :'),
                    Container(
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Align(
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.purple[100],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Align(
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apple (500) x ' + cart.quantity.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (cart.quantity * 500).toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
