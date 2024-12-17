import 'package:ai_diet/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diyetko',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: LoginScreen(title: 'Diyetko'),
    );
  }
}

class ScreenUtil {
  final BuildContext context;
  late double ekranGenisligi;
  late double ekranYuksekligi;

  ScreenUtil(this.context) {
    ekranGenisligi = MediaQuery.of(context).size.width;
    ekranYuksekligi = MediaQuery.of(context).size.height;
  }

  double genislikOranla(double oran) {
    return ekranGenisligi * oran;
  }

  double yukseklikOranla(double oran) {
    return ekranYuksekligi * oran;
  }
}
