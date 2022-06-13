import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, String> headersMap = {
  'Content-Type': 'application/json; charset=UTF-8',
  // 'Authorization': ,
};

class DataBaseMethods {
  String baseUrl = "http://192.168.182.246:3000";

//
//

//Admin Calls Start from here

//Admin registration
  Future<dynamic> registerAdmin(String clgName, String hostelName,
      String password, String confirmPassword) async {
    String endPoint = '/admin';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> registerDetails = {
      "clgName": clgName,
      "hostelName": hostelName,
      "password": password,
    };
    var result;
    try {
      final response = await http.post(
        Uri.parse(finalUrl),
        body: jsonEncode(registerDetails),
        headers: headersMap,
      );
      result = jsonDecode(response.body);
      // print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Admin Login
  Future<dynamic> loginAdmin(String id, String password) async {
    String endPoint = '/admin/login';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      // "id": id.toString(),
      "id": id,
      "password": password,
    };
    var result;
    try {
      final response = await http.post(
        Uri.parse(finalUrl),
        body: jsonEncode(loginDetails),
        headers: headersMap,
      );
      result = jsonDecode(response.body);
      print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Admin Dashboard Data Fetch
  Future<dynamic> getAdminData(String jwtToken) async {
    String endPoint = '/admin/info';
    String finalUrl = baseUrl + endPoint;
    /* Map<String, dynamic> loginDetails = {
      "personalNumber": "6290949425",
      "password": "password"
    }; */
    var result;
    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: {
          "Authorization": "Bearer " + jwtToken,
        },
      );
      result = jsonDecode(response.body);
      // print("Over here");
      // print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Student Calls Start from Here

//Student Registraing API
  Future<dynamic> registerStudent(
    String name,
    String phoneNumber,
    String hostelCode,
    int roomNumber,
    String guardianPhoneNumber,
    String password,
  ) async {
    String endPoint = '/student';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      "name": name,
      "password": password,
      "hostelID": hostelCode,
      "personalNumber": phoneNumber,
      "guardianNumber": guardianPhoneNumber,
      "roomNo": roomNumber,
    };
    var result;
    try {
      final response = await http.post(
        Uri.parse(finalUrl),
        body: jsonEncode(loginDetails),
        headers: headersMap,
      );
      result = jsonDecode(response.body);
      // print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Student Login Calls

  Future<dynamic> logInStudent(String phoneNumber, String password) async {
    String endPoint = '/student/login';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      "personalNumber": phoneNumber,
      "password": password,
    };
    var result;
    try {
      final response = await http.post(
        Uri.parse(finalUrl),
        body: jsonEncode(loginDetails),
        headers: headersMap,
      );
      result = jsonDecode(response.body);
      // print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Student Dashboard Data Fetch
  Future<dynamic> getStudentData(String jwtToken) async {
    String endPoint = '/student';
    String finalUrl = baseUrl + endPoint;
    var result;
    try {
      final response = await http.get(
        Uri.parse(finalUrl),
        // body: jsonEncode(loginDetails),
        headers: {
          "Authorization": "Bearer " + jwtToken,
        },
      );
      result = jsonDecode(response.body);
      // print("Over here");
      print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Student Food Preferance Update
  Future<dynamic> changeFoodType(bool isVeg, String jwtToken) async {
    String endPoint = '/student';
    String finalUrl = baseUrl + endPoint;
    String foodType = isVeg ? "veg" : "nonVeg";
    var result;
    try {
      final response = await http.put(
        Uri.parse(finalUrl),
        body: jsonEncode({"foodPrefarence": foodType}),
        headers: {
          "Authorization": "Bearer " + jwtToken,
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      result = jsonDecode(response.body);
      // print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

//Student attendace Status
  Future<dynamic> attendanceStatus(bool isPresent, String jwtToken) async {
    String endPoint = '/student';
    String finalUrl = baseUrl + endPoint;
    String attendance = isPresent ? "present" : "absent";
    var result;
    try {
      final response = await http.put(
        Uri.parse(finalUrl),
        body: jsonEncode({"presentStatus": attendance}),
        headers: {
          "Authorization": "Bearer " + jwtToken,
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

  /*  Future<dynamic> getAdminData() async {
    String endPoint = '/admin/login';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      // "id": id.toString(),
      "id": "jLwPOxHV",
      "password": "password",
    };
    var result;
    try {
      final response = await http.post(
        Uri.parse(finalUrl),
        body: jsonEncode(loginDetails),
        headers: headersMap,
      );
      result = jsonDecode(response.body);
      
      
      ;
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  } */
}
