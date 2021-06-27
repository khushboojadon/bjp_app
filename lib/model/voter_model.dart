class VoterModel {
  int id;
  String acNo;
  String acName;
  String engMathak;
  String mathak;
  String address;
  String engHouseNo;
  String engAddress;
  String partNo;
  String slnoinpart;
  String houseNo;
  String fName;
  String mName;
  String surname;
  String engFName;
  String engMName;
  String engSurname;
  String sex;
  String age;
  String idcardNo;
  Null mobno;
  String rln;
  String addmod;
  String sectionNo;
  Null status;
  Null createdBy;
  String createdAt;
  String updatedAt;

  VoterModel(
      {this.id,
      this.acNo,
      this.acName,
      this.engMathak,
      this.mathak,
      this.address,
      this.engHouseNo,
      this.engAddress,
      this.partNo,
      this.slnoinpart,
      this.houseNo,
      this.fName,
      this.mName,
      this.surname,
      this.engFName,
      this.engMName,
      this.engSurname,
      this.sex,
      this.age,
      this.idcardNo,
      this.mobno,
      this.rln,
      this.addmod,
      this.sectionNo,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  VoterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acNo = json['ac_no'];
    acName = json['ac_name'];
    engMathak = json['eng_mathak'];
    mathak = json['mathak'];
    address = json['address'];
    engHouseNo = json['eng_house_no'];
    engAddress = json['eng_address'];
    partNo = json['part_no'];
    slnoinpart = json['slnoinpart'];
    houseNo = json['house_no'];
    fName = json['f_name'];
    mName = json['m_name'];
    surname = json['surname'];
    engFName = json['eng_f_name'];
    engMName = json['eng_m_name'];
    engSurname = json['eng_surname'];
    sex = json['sex'];
    age = json['age'];
    idcardNo = json['idcard_no'];
    mobno = json['mobno'];
    rln = json['rln'];
    addmod = json['addmod'];
    sectionNo = json['section_no'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ac_no'] = this.acNo;
    data['ac_name'] = this.acName;
    data['eng_mathak'] = this.engMathak;
    data['mathak'] = this.mathak;
    data['address'] = this.address;
    data['eng_house_no'] = this.engHouseNo;
    data['eng_address'] = this.engAddress;
    data['part_no'] = this.partNo;
    data['slnoinpart'] = this.slnoinpart;
    data['house_no'] = this.houseNo;
    data['f_name'] = this.fName;
    data['m_name'] = this.mName;
    data['surname'] = this.surname;
    data['eng_f_name'] = this.engFName;
    data['eng_m_name'] = this.engMName;
    data['eng_surname'] = this.engSurname;
    data['sex'] = this.sex;
    data['age'] = this.age;
    data['idcard_no'] = this.idcardNo;
    data['mobno'] = this.mobno;
    data['rln'] = this.rln;
    data['addmod'] = this.addmod;
    data['section_no'] = this.sectionNo;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
