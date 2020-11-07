import 'package:shared_preferences/shared_preferences.dart';

const ACCESSTOKEN = "ACCESSTOKEN";

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();

  static final SharedPreferenceHelper _singleton = SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  Future<bool> setAccessToken(String value) async {
    return (await SharedPreferences.getInstance()).setString(ACCESSTOKEN, value);
  }

  Future<String> getAccessToken() async {
    return (await SharedPreferences.getInstance()).getString(ACCESSTOKEN);
  }

}