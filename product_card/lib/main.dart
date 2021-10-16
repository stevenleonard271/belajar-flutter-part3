import 'package:flutter/material.dart';
import 'package:product_card/product_card.dart';
import 'package:product_card/product_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: Text('Product Card Example'),
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  imageURL:
                      'https://www.kindpng.com/picc/m/274-2744523_mix-fruit-png-free-download-fruit-png-transparent.png',
                  name: 'Buah-Buahan Mix 1 kg',
                  price: 'Rp.25000',
                  notification:
                      (productState.quantity > 5) ? 'Diskon 10%' : null,
                  quantity: productState.quantity,
                  onAddCartTap: () {},
                  onIncTap: () {
                    productState.quantity++;
                  },
                  onDecTap: () {
                    productState.quantity--;
                  },
                ),
              ),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
