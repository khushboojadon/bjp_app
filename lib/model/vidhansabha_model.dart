class VidhansabhaModel {
  int id;
  int cityId;
  String vidhansabhaName;
  String createdAt;
  String updatedAt;

  VidhansabhaModel(
      {this.id,
      this.cityId,
      this.vidhansabhaName,
      this.createdAt,
      this.updatedAt});

  VidhansabhaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    vidhansabhaName = json['vidhansabha_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['vidhansabha_name'] = this.vidhansabhaName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
