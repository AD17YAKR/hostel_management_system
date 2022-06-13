import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_mangement_system/models/token.dart';
import 'package:hostel_mangement_system/services/database.dart';

import 'package:hostel_mangement_system/views/landing_page.dart';

import '../../models/student.dart';

class AdminHomePage extends StatefulWidget {
  final Token adminToken;
  const AdminHomePage({
    Key? key,
    required this.adminToken,
  }) : super(key: key);
  @override
  State<AdminHomePage> createState() => AdminLogInSignUpState();
}

class AdminLogInSignUpState extends State<AdminHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  DataBaseMethods dataBaseMethods = DataBaseMethods();
  String vegStudents = "";
  String nonVegStudents = "";
  var studentDatafromServer;
  bool isLoading = false;
  // List<Student> studentData = [];
  @override
  void initState() {
    super.initState();
    getAdminData();
  }

  getAdminData() async {
    setState(() {
      isLoading = true;
    });
    final results =
        await dataBaseMethods.getAdminData(widget.adminToken.jwtToken);
    vegStudents = await results["vegCount"].toString();
    nonVegStudents = await results["nonVegCount"].toString();
    studentDatafromServer = await results['studentInfo'];
    setState(() {
      isLoading = false;
    });
    /* for (int i = 0; i <=studentDatafromServer.length; i++) {
      studentData[i].name = studentDatafromServer['name'];
      studentData[i].roomNo = studentDatafromServer['roomNo'].toString();
      studentData[i].guardianNumber =
          studentDatafromServer['guardianNumber'].toString();
      studentData[i].personalNumber = studentDatafromServer['personalNumber'];
      studentData[i].isVeg = studentDatafromServer['foodPrefarence'] == "veg";
      studentData[i].isPresent = studentDatafromServer['present'] == "present";
    } */
    // print(studentDatafromServer.length);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFF1F4F8),
              automaticallyImplyLeading: false,
              title: Text(
                'Welcome Admin',
                style: GoogleFonts.outfit(
                  color: Color(0xFF0F1113),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Color(0xFF57636C),
                      size: 24,
                    ),
                    onPressed: () async {
                      Get.offAll(LandingPage());
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            ),
            backgroundColor: Color(0xFFF1F4F8),
            body: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                /*  Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Purulia Government Engineering College',
                  style: GoogleFonts.outfit(
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ), */
                /*  Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Old Boys Hostel',
                  style: GoogleFonts.outfit(
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ), */
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Id Number : ' + widget.adminToken.idNumber,
                        style: GoogleFonts.outfit(
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 7, 16, 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'VEG Students Present : ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.outfit(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        vegStudents,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.outfit(
                          // fontFamily: 'Outfit',
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'NON-VEG Students Present : ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.outfit(
                          color: Color(0xFFFF0000),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        nonVegStudents,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.outfit(
                          // fontFamily: 'Outfit',
                          color: Color(0xFFFF0000),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                if (studentDatafromServer.length != 0)
                  Expanded(
                    child: ListView.separated(
                      itemCount: studentDatafromServer.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return StudentCard(studentDatafromServer[index]);
                      },
                    ),
                  ),
              ],
            ),
          );
  }

  Widget StudentCard(var student) {
    print(student);
    String? name = student['name'] ?? "Error";
    bool? isVeg =
        student['foodPrefarence'].toString().toUpperCase() == "VEG" ?? false;
    String? personalNumber = student['personalNumber'] ?? "Error";
    String? guardianNumber = student['guardianNumber'] ?? "Error";
    int? roomNo = student['roomNo'] ?? 0;
    bool? isPresent = student['presentStatus'] == "present" ? true : false;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x411D2429),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: GoogleFonts.outfit(
                        // fontFamily: 'Outfit',
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AutoSizeText(
                          'Personal No. - ',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.outfit(
                            // fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        AutoSizeText(
                          personalNumber!,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.outfit(
                            // fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AutoSizeText(
                          'Guardian No. -',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.outfit(
                            // fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        AutoSizeText(
                          guardianNumber!,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.outfit(
                            // fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    isVeg ? 'VEG' : "NON - VEG",
                    style: GoogleFonts.raleway(
                      // fontFamily: 'Raleway',
                      color: isVeg ? Colors.green : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Room No. - ' + roomNo!.toString(),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.outfit(
                      // fontFamily: 'Outfit',
                      color: Color(0xFF0F1113),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    isPresent ? "Present" : "Absent",
                    style: TextStyle(
                      color: isPresent ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
