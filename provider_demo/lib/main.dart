import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("!!!BUILD WIDGET!!!");
    return MaterialApp(
      home: ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, providerValue, child) => Scaffold(
            backgroundColor: providerValue.themeColor,
            appBar: AppBar(
              backgroundColor: providerValue.themeColor,
              title: Text(
                "Provider State Management",
                style: TextStyle(color: providerValue.textColor),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LIGHT THEME",
                      style: TextStyle(color: providerValue.textColor),
                    ),
                    Switch(
                      value: providerValue.isDark,
                      onChanged: (changeValue) {
                        providerValue.isDark = changeValue;
                      },
                    ),
                    Text(
                      "DARK THEME",
                      style: TextStyle(color: providerValue.textColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
