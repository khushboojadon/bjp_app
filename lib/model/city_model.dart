class CityModel {
  int id;
  String cityName;
  String createdAt;
  String updatedAt;

  CityModel({this.id, this.cityName, this.createdAt, this.updatedAt});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['city_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_name'] = this.cityName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
