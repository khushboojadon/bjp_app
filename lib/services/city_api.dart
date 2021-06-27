import 'dart:convert';
import 'package:bjp_app/model/city_model.dart';
import 'package:bjp_app/model/login_model.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:http/http.dart' as http;

class CityApi {
  Future<bool> city() async {
    final headers = {'Content-Type': 'application/json'};
    //   Map<String, dynamic> body = {"email": email, "password": password};
    // String jsonBody = json.encode(body);

    var response = await http.get(
      "https://bjppagepramukh.co.in/api/city",
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      int cityid = Constants.pref.getInt("city_id");
      // print(cityid);
      final data = json.decode(response.body) as List;
      // final resdata = CityModel.fromJson(data);
      print(data[0]['id']);
      for (int i = 0; i < data.length; i++) {
        //  print('heeloooooo');
        if (data[i]['id'] == cityid) {
          Constants.pref.setString("city", data[i]['city_name']);
          //print("city id${data[i]['city_name']}");
        }
      }
      return true;
    } else
      return false;
  }
}
