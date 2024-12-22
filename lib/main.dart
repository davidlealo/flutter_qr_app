import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/qr_scanner_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/qr-scanner': (context) => QrScannerScreen(),
      },
    );
  }
}
