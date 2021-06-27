import 'dart:convert';
import 'package:bjp_app/model/login_model.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<bool> login(String email, String password) async {
    final headers = {'Content-Type': 'application/json'};
    //   Map<String, dynamic> body = {"email": email, "password": password};
    // String jsonBody = json.encode(body);
    var response = await http.post(
      "https://bjppagepramukh.co.in/api/login?email=$email&password=$password",
      // "http://apk.bjppagepramukh.in/login?email=$email&password=$password",
      //   "https://dakshsolarenergy.com/uploadbjp/public/api/login?email=$email&password=$password",
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = LoginModel.fromJson(json.decode(response.body));
      Constants.pref.setString("email", data.success.email);
      Constants.pref.setInt("verification", data.success.verificationStatus);
      Constants.pref.setBool("loggedIn", true);
      Constants.pref.setInt("city_id", data.success.cityId);
      return true;
    } else
      return false;
  }
}
