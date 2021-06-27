import 'package:dio/dio.dart';

var dio = Dio();

class FormApi {
  Future<bool> submitDetails(
      {String pp,
      String cpid,
      String cpname,
      String wardNo,
      String wardPartNo,
      String wardName,
      String serialNo,
      String houseNo,
      String localityId,
      String idCardNo,
      String surname,
      String fname,
      String mname,
      String bloodGroup,
      String designation,
      String city,
      String dob,
      String dom,
      String mobNo,
      String pageNo,
      String createdBy,
      var img}) async {
    String fileName = img.path.split('/').last;
    final headers = {'Content-Type': 'application/json'};
    FormData requestbody = FormData.fromMap({
      "pp": pp,
      "cpid": cpid,
      "cpname": cpname,
      "ward_no": wardNo,
      "ward_part_no": wardPartNo,
      "ward_name": wardName,
      "newslno": serialNo,
      "house_no": houseNo,
      "localityid": localityId,
      "idcard_no": idCardNo,
      "surname": surname,
      "f_name": fname,
      "m_name": mname,
      "sex": null,
      "age": null,
      "ps_locn": null,
      "rln_type": null,
      "pdfpage": pageNo,
      "pdfline": null,
      "mobile_no": mobNo,
      "ac_no": null,
      "blood_group": bloodGroup,
      "dob": dob,
      "dom": dom,
      "designation": designation,
      "city_name": city,
      "status": "1",
      "created_by": createdBy,
      "image": await MultipartFile.fromFile(img.path, filename: fileName)
    });
    var response = await dio.post(
      "https://bjppagepramukh.co.in/api/validate/store",
      // options: Options(headers: headers),
      data: requestbody,
    );
    if (response.statusCode == 200) {
      print("user detail ${response.statusCode}");
      return true;
    } else if (response.statusCode != 200) {
      return false;
    } else
      return false;
  }
}
