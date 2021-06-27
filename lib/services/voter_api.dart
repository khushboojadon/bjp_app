import 'dart:convert';
import 'package:bjp_app/model/voter_model.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:http/http.dart' as http;

class VoterApi {
  Future<bool> voterSearch(String voterId) async {
    final headers = {'Content-Type': 'application/json'};
    var response = await http.get(
      "https://bjppagepramukh.co.in/api/validate/search/$voterId",
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = VoterModel.fromJson(json.decode(response.body));
      Constants.pref.setString("partNo", data.partNo);
      Constants.pref.setString("address_no", data.engHouseNo);
      Constants.pref.setString("address", data.engAddress);
      Constants.pref.setString("first_name", data.fName);
      Constants.pref.setString("medium_name", data.mName);
      Constants.pref.setString("last_name", data.surname);
      Constants.pref.setString("serial_no", data.slnoinpart);
      Constants.pref.setString("mob_no", data.mobno);
      Constants.pref.setString("voter_id", data.idcardNo);
      return true;
    } else
      return false;
  }
}
