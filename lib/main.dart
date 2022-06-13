import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_mangement_system/helper/shared_preferences.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:hostel_mangement_system/views/landing_page.dart';
import 'package:hostel_mangement_system/views/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HelperFunctions helperFunction = HelperFunctions();
// bool isAdminLoggedIn=helperFunction.saveAdminToken();;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
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
