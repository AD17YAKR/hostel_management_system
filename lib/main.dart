import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:hostel_mangement_system/views/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme: ThemeData(
        primaryColor: Colors.grey,
        appBarTheme: AppBarTheme(color: Colors.teal),
        scaffoldBackgroundColor: backGroundColor,
        textTheme: ThemeData.light().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          buttonColor: Colors.purple,
        ),
      ),
    );
  }
}
