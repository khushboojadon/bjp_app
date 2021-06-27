// class LoginModel {
//   Success success;

//   LoginModel({this.success});

//   LoginModel.fromJson(Map<String, dynamic> json) {
//     success =
//         json['success'] != null ? new Success.fromJson(json['success']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.success != null) {
//       data['success'] = this.success.toJson();
//     }
//     return data;
//   }
// }

// class Success {
//   String token;
//   int id;
//   String name;
//   String email;
//   int cityId;
//   String isAdmin;
//   String verificationStatus;

//   Success(
//       {this.token,
//       this.id,
//       this.name,
//       this.email,
//       this.cityId,
//       this.isAdmin,
//       this.verificationStatus});

//   Success.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     cityId = json['city_id'];
//     isAdmin = json['is_admin'];
//     verificationStatus = json['verification_status '];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['city_id'] = this.cityId;
//     data['is_admin'] = this.isAdmin;
//     data['verification_status '] = this.verificationStatus;
//     return data;
//   }
// }
class LoginModel {
  String token;
  Success success;

  LoginModel({this.token, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    return data;
  }
}

class Success {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int status;
  int isAdmin;
  int verificationStatus;
  dynamic image;
  dynamic createdBy;
  int cityId;
  String createdAt;
  String updatedAt;

  Success(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.status,
      this.isAdmin,
      this.verificationStatus,
      this.image,
      this.createdBy,
      this.cityId,
      this.createdAt,
      this.updatedAt});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    isAdmin = json['is_admin'];
    verificationStatus = json['verification_status'];
    image = json['image'];
    createdBy = json['created_by'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['is_admin'] = this.isAdmin;
    data['verification_status'] = this.verificationStatus;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
