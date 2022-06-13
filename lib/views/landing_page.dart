import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hostel_mangement_system/views/admin/adminLogin.dart';
import 'package:hostel_mangement_system/views/admin/adminHomePage.dart';
import 'package:hostel_mangement_system/views/student/studentLogin.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Welcome',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    // fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Hostel Management System',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    // fontFamily: 'Poppins',
                    color: Color(0xFF9E9E9E),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/hms.png',
                    width: 350,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Kindly Log In',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Get.to(StudentLogInSignUp());
                  },
                  child: Text(
                    'Student',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Color(0xFF0F1113),
                    minimumSize: Size(double.infinity, 50),
                    elevation: 3,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(AdminLogInSignIn());
                  },
                  child: Text(
                    'Admin',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Color(0xFF0F1113),
                    minimumSize: Size(double.infinity, 50),
                    elevation: 3,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
