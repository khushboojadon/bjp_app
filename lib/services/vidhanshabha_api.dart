import 'dart:convert';
import 'package:bjp_app/model/city_model.dart';
import 'package:bjp_app/model/login_model.dart';
import 'package:bjp_app/model/vidhansabha_model.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:http/http.dart' as http;

class VidhansabhaApi {
  Future<String> vidhanshabha() async {
    final headers = {'Content-Type': 'application/json'};
    //   Map<String, dynamic> body = {"email": email, "password": password};
    // String jsonBody = json.encode(body);
    int cityid = Constants.pref.getInt("city_id");
    print("city id $cityid");
    var response = await http.get(
      "https://bjppagepramukh.co.in/api/vidhansabha/$cityid",
      headers: headers,
    );
    //  if (response.statusCode == 200) {
    print(response.statusCode);
    //  String cityid = Constants.pref.getString("city_id");
    // print(cityid);
    final data = json.decode(response.body);
    return data;
  }
  //   }
  //   return
  // }
}
