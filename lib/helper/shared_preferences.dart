import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceAdminToken = "ISLOGGEDIN";

  //
  //
  //

  Future<bool> saveAdminToken(String userToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(sharedPreferenceAdminToken, userToken);
  }
}
