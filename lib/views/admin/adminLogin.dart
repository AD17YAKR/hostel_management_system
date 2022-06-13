import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_mangement_system/models/token.dart';
import 'package:hostel_mangement_system/services/database.dart';
import 'package:hostel_mangement_system/views/admin/adminHomePage.dart';
import 'package:hostel_mangement_system/views/admin/adminSignup.dart';

class AdminLogInSignIn extends StatefulWidget {
  const AdminLogInSignIn({Key? key}) : super(key: key);

  @override
  State<AdminLogInSignIn> createState() => _AdminLogInSignInState();
}

class _AdminLogInSignInState extends State<AdminLogInSignIn> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController idNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  DataBaseMethods dataBaseMethods = DataBaseMethods();
  loginAdmin() async {
    print("started");
    final results = await dataBaseMethods.loginAdmin(
      idNoController.text,
      passwordController.text,
    );
    String jwtToken = results['jwtToken'] ?? "failed";
    if (jwtToken == "failed")
      return Get.snackbar("", "Some Values missing");
    else
      return Get.to(() => AdminHomePage(
            adminToken:
                Token(jwtToken: jwtToken, idNumber: idNoController.text),
          ));
    // print(jwtToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x004B39EF),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Text(
                            'ADMIN LOGIN',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Text(
                                  'Kindly Enter Your Details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.outfit(
                                    // fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: idNoController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ID Number',
                              labelStyle: GoogleFonts.outfit(
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter your ID Number...',
                              hintStyle: GoogleFonts.lexendDeca(
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                            ),
                            style: GoogleFonts.outfit(
                              color: Color(0xFF0F1113),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.outfit(
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter your password...',
                              hintStyle: GoogleFonts.lexendDeca(
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF57636C),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(40, 24, 40, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            loginAdmin();
                          },
                          child: Text(
                            'Log In',
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Don\'t Have An Account ?\nClick Here',
                        textAlign: TextAlign.center,
                        // style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.group_add_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.to(() => AdminSignUp());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
