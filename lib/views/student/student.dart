import 'package:flutter/material.dart';
import 'package:hostel_mangement_system/utils/colors.dart';
import 'package:hostel_mangement_system/widgets/myElevatedButton.dart';

class StudentLogInSignUp extends StatefulWidget {
  const StudentLogInSignUp({Key? key}) : super(key: key);

  @override
  State<StudentLogInSignUp> createState() => _StudentLogInSignUpState();
}

class _StudentLogInSignUpState extends State<StudentLogInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyElevatedButton(
              onPressed: () {},
              child: Text("LogIn"),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color(0xff374ABE),
                  Colors.pinkAccent,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don’t have account?\n",
            style: TextStyle(color: Colors.black),
          ),
          GestureDetector(
            onTap: () {
              // Get.to(() => SignUp());
            },
            child: Text(
              "Create new account.\n",
              style: TextStyle(color: primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
