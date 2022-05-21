import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, String> headersMap = {
  'Content-Type': 'application/json; charset=UTF-8',
  // 'Authorization': Constants.myToken ?? '',
};

class DataBaseMethods {
  String baseUrl = "http://192.168.0.129:3000";

//
//
  Future<dynamic> registerAdmin(
      clgName, hostelName, password, confirmPassword) async {
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
      print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

  Future<dynamic> loginAdmin(id, password) async {
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
      print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  }

  Future<dynamic> registerStudent(name, phoneNumber, hostelCode, roomNumber,
      guardianPhoneNumber, password) async {
    String endPoint = '/student';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      "name": "name",
      "password": "password",
      "hostelID": "jLwPOxHV",
      "personalNumber": "6290949425",
      "guardianNumber": "6290438787",
      "roomNo": 41,
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

  Future<dynamic> logInStudent(phoneNumber, password) async {
    String endPoint = '/student/login';
    String finalUrl = baseUrl + endPoint;
    Map<String, dynamic> loginDetails = {
      "personalNumber": "6290949425",
      "password": "password"
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
      print(result);
      return result;
    } catch (e) {
      print(e);
      return "Not Working";
    }
  } */
}
