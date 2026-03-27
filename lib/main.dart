import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
      ),
      home: Home(),
      builder: (context, child) => SafeArea(child: child!),
    );
  }
}
