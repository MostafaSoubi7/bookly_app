import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
