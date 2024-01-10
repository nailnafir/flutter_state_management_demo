import 'package:flutter/material.dart';
import 'package:flutter_multi_provider_demo/cart_provider.dart';
import 'package:flutter_multi_provider_demo/money_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD WIDGET");
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MoneyProvider>(
            create: (context) => MoneyProvider(),
          ),
          ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Consumer2<CartProvider, MoneyProvider>(
            builder: (context, cartValue, moneyValue, child) =>
                FloatingActionButton(
              backgroundColor: Colors.purple,
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                if (moneyValue.balance >= 500) {
                  cartValue.quantity += 1;
                  moneyValue.balance -= 500;
                }
              },
            ),
          ),
          appBar: AppBar(
            title: const Text("Multi Provider"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Balance"),
                  Container(
                    width: 150,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple[100],
                      border: Border.all(
                        color: Colors.purple,
                        width: 1,
                      ),
                    ),
                    child: Consumer<MoneyProvider>(
                      builder: (context, moneyValue, child) => Text(
                        moneyValue.balance.toString(),
                        style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.purple,
                    width: 1,
                  ),
                ),
                child: Consumer<CartProvider>(
                  builder: (context, cartValue, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Book (500) x ${cartValue.quantity}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        (500 * cartValue.quantity).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<MoneyProvider>(
                builder: (context, moneyValue, child) =>
                    (moneyValue.balance < 500)
                        ? const Text(
                            "Saldo Habis",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
