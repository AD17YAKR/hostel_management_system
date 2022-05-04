import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:hostel_mangement_system/views/admin/admin.dart';
import 'package:hostel_mangement_system/views/student/student.dart';
import 'package:hostel_mangement_system/widgets/myElevatedButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: primaryColor,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyElevatedButton(
                onPressed: () {
                  Get.to(AdminLogInSignUp());
                },
                child: Text("Admin"),
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff64B6FF),
                    Color(0xff374ABE),
                  ],
                )
                // style: ElevatedButton.styleFrom(primary: ),
                ),
            SizedBox(
              height: 10,
            ),
            MyElevatedButton(
              onPressed: () {
                Get.to(StudentLogInSignUp());
              },
              child: Text("Student"),
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
