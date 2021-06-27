import 'dart:convert';
import 'dart:io';
import 'package:bjp_app/services/city_api.dart';
import 'package:bjp_app/services/user_details_api.dart';
import 'package:bjp_app/services/vidhanshabha_api.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  bool isVoter;
  Home({this.isVoter});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _wardNo = TextEditingController();
  TextEditingController _serialNo = TextEditingController();
  TextEditingController _wardName = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _partNo = TextEditingController();
  TextEditingController _voterId = TextEditingController();
  TextEditingController _dom = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _mobNo = TextEditingController();
  TextEditingController _pageNo = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Item selectedBloodGroup;
  VidhansabhaApi _vidhansabhaApi = VidhansabhaApi();
  FormApi _formApi = FormApi();
  List<Item> bloodGroupList = <Item>[
    const Item(
      'A Positive (A+)',
    ),
    const Item(
      'A Negative (A-)',
    ),
    const Item(
      'B Positive (A+)',
    ),
    const Item(
      'B Negative (B-)',
    ),
    const Item(
      'O Positive (O+)',
    ),
    const Item(
      'O Negative (O-)',
    ),
    const Item(
      'AB Positive (AB+)',
    ),
    const Item(
      'AB Negative (AB-)',
    ),
  ];
  Item selectedDesignation;
  List<Item> designationList = <Item>[
    const Item(
      'પેજ પ્રતિનિધિ',
    ),
    const Item(
      'પેજ પ્રમુખ',
    ),
  ];
  Item selectedWard;
  List<Item> AhmedabadWardList = <Item>[
    const Item(
      '1',
    ),
    const Item(
      '2',
    ),
    const Item(
      '3',
    ),
    const Item(
      '4',
    ),
    const Item(
      '5',
    ),
    const Item(
      '6',
    ),
    const Item(
      '7',
    ),
    const Item(
      '8',
    ),
    const Item(
      '9',
    ),
    const Item(
      '10',
    ),
    const Item(
      '11',
    ),
    const Item(
      '12',
    ),
    const Item(
      '13',
    ),
    const Item(
      '14',
    ),
    const Item(
      '15',
    ),
    const Item(
      '16',
    ),
    const Item(
      '17',
    ),
    const Item(
      '18',
    ),
    const Item(
      '19',
    ),
    const Item(
      '20',
    ),
    const Item(
      '21',
    ),
    const Item(
      '22',
    ),
    const Item(
      '23',
    ),
    const Item(
      '24',
    ),
    const Item(
      '25',
    ),
    const Item(
      '26',
    ),
    const Item(
      '27',
    ),
    const Item(
      '28',
    ),
    const Item(
      '29',
    ),
    const Item(
      '30',
    ),
    const Item(
      '31',
    ),
    const Item(
      '32',
    ),
    const Item(
      '33',
    ),
    const Item(
      '34',
    ),
    const Item(
      '35',
    ),
    const Item(
      '36',
    ),
    const Item(
      '37',
    ),
    const Item(
      '38',
    ),
    const Item(
      '39',
    ),
    const Item(
      '40',
    ),
    const Item(
      '41',
    ),
    const Item(
      '42',
    ),
    const Item(
      '43',
    ),
    const Item(
      '44',
    ),
    const Item(
      '45',
    ),
    const Item(
      '46',
    ),
    const Item(
      '47',
    ),
    const Item(
      '48',
    ),
  ];
  //Item selectedSuratWard;
  List<Item> suratWardList = <Item>[
    const Item(
      '1',
    ),
    const Item(
      '2',
    ),
    const Item(
      '3',
    ),
    const Item(
      '4',
    ),
    const Item(
      '5',
    ),
    const Item(
      '6',
    ),
    const Item(
      '7',
    ),
    const Item(
      '8',
    ),
    const Item(
      '9',
    ),
    const Item(
      '10',
    ),
    const Item(
      '11',
    ),
    const Item(
      '12',
    ),
    const Item(
      '13',
    ),
    const Item(
      '14',
    ),
    const Item(
      '15',
    ),
    const Item(
      '16',
    ),
    const Item(
      '17',
    ),
    const Item(
      '18',
    ),
    const Item(
      '19',
    ),
    const Item(
      '20',
    ),
    const Item(
      '21',
    ),
    const Item(
      '22',
    ),
    const Item(
      '23',
    ),
    const Item(
      '24',
    ),
    const Item(
      '25',
    ),
    const Item(
      '26',
    ),
    const Item(
      '27',
    ),
    const Item(
      '28',
    ),
    const Item(
      '29',
    ),
    const Item(
      '30',
    ),
  ];
  // Item selectedBarodaWard;
  List<Item> barodaWardList = <Item>[
    const Item(
      '1',
    ),
    const Item(
      '2',
    ),
    const Item(
      '3',
    ),
    const Item(
      '4',
    ),
    const Item(
      '5',
    ),
    const Item(
      '6',
    ),
    const Item(
      '7',
    ),
    const Item(
      '8',
    ),
    const Item(
      '9',
    ),
    const Item(
      '10',
    ),
    const Item(
      '11',
    ),
    const Item(
      '12',
    ),
    const Item(
      '13',
    ),
    const Item(
      '14',
    ),
    const Item(
      '15',
    ),
    const Item(
      '16',
    ),
    const Item(
      '17',
    ),
    const Item(
      '18',
    ),
    const Item(
      '19',
    ),
  ];
  String selectedVidhansabha;
  // List<Item> VidhansabhaList = <Item>[
  //   const Item(
  //     'Olpad',
  //   ),
  //   const Item(
  //     'Mangrol',
  //   ),
  //   const Item(
  //     'Mandvi (Surat Area)',
  //   ),
  //   const Item(
  //     'Kamrej',
  //   ),
  //   const Item(
  //     'Surat East',
  //   ),
  //   const Item(
  //     'Surat North',
  //   ),
  //   const Item(
  //     'Varachha Road',
  //   ),
  //   const Item(
  //     'Karanj',
  //   ),
  //   const Item(
  //     'Limbayat',
  //   ),
  //   const Item(
  //     'Udhana',
  //   ),
  //   const Item(
  //     'Majura',
  //   ),
  //   const Item(
  //     'Katargam',
  //   ),
  //   const Item(
  //     'Surat West',
  //   ),
  //   const Item(
  //     'Choryasi',
  //   ),
  //   const Item(
  //     'Bardoli',
  //   ),
  //   const Item(
  //     'Mahuva',
  //   ),
  // ];
  List vidhanshaList = List();

  bool submit;
  Future<String> vidhanshabha() async {
    final headers = {'Content-Type': 'application/json'};
    //   Map<String, dynamic> body = {"email": email, "password": password};
    // String jsonBody = json.encode(body);
    int cityid = Constants.pref.getInt("city_id");
    var response = await http.get(
      "https://bjppagepramukh.co.in/api/vidhansabha/$cityid",
      headers: headers,
    );
    //  if (response.statusCode == 200) {
    print(response.statusCode);
    // int cityid = Constants.pref.getInt("city_id");
    // print(cityid);
    final data = json.decode(response.body);
    setState(() {
      vidhanshaList = data;
    });
    return "success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.vidhanshabha();
    Constants.pref.setBool("voter", widget.isVoter);
  }

  void _showSuccessDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          //   title: new Text("Please enter correct email and password"),
          content: new Text("Data is saved sucessfully."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Home(isVoter: Constants.pref.getBool("voter"))),
                    (route) => false);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             Home(isVoter: Constants.pref.getBool("voter"))));
                // Constants.pref.clear();
                // _address.clear();
                // _dob.clear();
                // _dom.clear();
                // img.delete();
                // _name.clear();
                // _pageNo.clear();
                // _mobNo.clear();
              },
            ),
          ],
        );
      },
    );
  }

  void _showFailedDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          //   title: new Text("Please enter correct email and password"),
          content: new Text("Please enter all details"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      img = croppedImage;
      setState(() {});
    }
  }

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  File img;

  _opencamera(BuildContext context) async {
    PickedFile file = await _picker.getImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    this.setState(() {
      _imageFile = file;
      _cropImage(_imageFile.path);
      img = File(_imageFile.path);

      // compressFile(img);
    });
  }

  _opengallery(BuildContext context) async {
    PickedFile file = await _picker.getImage(source: ImageSource.gallery);
    Navigator.of(context).pop();
    this.setState(() {
      _imageFile = file;
      _cropImage(_imageFile.path);
      img = File(
        _imageFile.path,
      );
      //   compressFile(img);
    });
  }

  var result;
  Future<File> compressFile(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 1,
    );
    print("file size ${file.lengthSync()}");
    print("filee sizeee ${result.lengthSync()}");
    return result;
  }

  Widget _image() {
    if (_imageFile == null) {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.orange, width: 1)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.orange)),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '(*Image / ફોટો passport size only )',
            style: TextStyle(color: Colors.grey),
          ),
        )),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.orange)),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.orange, width: 1)),
        child: Center(
          child: Image.file(
            img,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<void> _showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Make a choice!',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          _opengallery(context);
                        },
                        child: Text('Gallery',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 18))),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            _opencamera(context);
                          },
                          child: Text('Camera',
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 18)),
                        ))
                  ],
                ),
              ));
        });
  }

  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(
        message: 'Loading.....',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.green, Colors.orange, Colors.white])),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Card(
                  elevation: 5.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'BHARTIYA JANTA PARTY',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'PAGE PRAMUKH/PRATINIDHI REGISTRATION',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        // Column(
                        //     children: <Widget>[
                        if (Constants.pref.getString("email") ==
                            "surat@gmail.com")
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Item>(
                                hint: Text("   Select the Ward No."),
                                value: selectedWard,
                                onChanged: (Item Value) {
                                  setState(() {
                                    selectedWard = Value;
                                  });
                                },
                                items: suratWardList.map((Item user) {
                                  return DropdownMenuItem<Item>(
                                    value: user,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        user.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        if (Constants.pref.getString("email") ==
                            "Ahmedabad@gmail.com")
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Item>(
                                hint: Text("   Select the Ward No."),
                                value: selectedWard,
                                onChanged: (Item Value) {
                                  setState(() {
                                    selectedWard = Value;
                                  });
                                },
                                items: AhmedabadWardList.map((Item user) {
                                  return DropdownMenuItem<Item>(
                                    value: user,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        user.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        if (Constants.pref.getString("email") ==
                            "Baroda@gmail.com")
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Item>(
                                hint: Text("   Select the Ward No."),
                                value: selectedWard,
                                onChanged: (Item Value) {
                                  setState(() {
                                    selectedWard = Value;
                                  });
                                },
                                items: barodaWardList.map((Item user) {
                                  return DropdownMenuItem<Item>(
                                    value: user,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        user.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        if (Constants.pref.getString("email") !=
                                "surat@gmail.com" &&
                            Constants.pref.getString("email") !=
                                "ahmedabad@gmail.com" &&
                            Constants.pref.getString("email") !=
                                "baroda@gmail.com")
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.orange)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _wardNo,
                                validator: (_wardNo) {
                                  if (_wardNo.isEmpty) {
                                    return "Please enter Ward No.";
                                  } else if (_wardNo.length >= 3) {
                                    return "Please enter 2 digit ward no.";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Word No /વોર્ડ નં.",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        widget.isVoter
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 28, right: 28),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Constants.pref
                                                  .getString("serail_no") ==
                                              "null"
                                          ? TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _serialNo,
                                              validator: (_serialNo) {
                                                if (_serialNo.isEmpty) {
                                                  return "Please enter Serial No";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Sr. No. / ક્રમાંક નં.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            )
                                          : Text(
                                              "${Constants.pref.getString("serial_no")}"),
                                    )),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.orange)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _serialNo,
                                    validator: (_serialNo) {
                                      if (_serialNo.isEmpty) {
                                        return "Please enter Serial No";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Sr. No. / ક્રમાંક નં.",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              controller: _wardName,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Word Name / વોર્ડ / મંડળ /ગામ નામ:",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        widget.isVoter
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 28, right: 28),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Constants.pref
                                                  .getString("first_name") ==
                                              "null"
                                          ? TextFormField(
                                              controller: _name,
                                              validator: (_name) {
                                                if (_name.isEmpty) {
                                                  return "Please enter Name";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Name / નામ",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            )
                                          : Text(
                                              "${Constants.pref.getString("first_name")} ${Constants.pref.getString("medium_name")} ${Constants.pref.getString("last_name")}"),
                                    )),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.orange)),
                                  child: TextFormField(
                                    controller: _name,
                                    validator: (_name) {
                                      if (_name.isEmpty) {
                                        return "Please enter Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name / નામ",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _mobNo,
                              validator: (_mobNo) {
                                if (_mobNo.isEmpty) {
                                  return "Please enter 10 digit number";
                                } else if (_mobNo.length != 10) {
                                  return "Please enter 10 digit number";
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile No. / મોબાઈલ નં.",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _dob,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "DOB / જન્મતારીખ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _dom,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "DOM / લગ્ન તારીખ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _pageNo,
                              validator: (_pageNo) {
                                var numValue = int.tryParse(_pageNo);
                                if (_pageNo.isEmpty) {
                                  return "Please enter page no.";
                                }
                                if (numValue >= 39) {
                                  return "enter less than 39";
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Page No.",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(left: 30, right: 30),
                        //   child: Container(
                        //     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5),
                        //         border: Border.all(color: Colors.orange)),
                        //     child: TextFormField(
                        //       controller: _city,
                        //       decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           hintText: "City Name / શહેર નામ",
                        //           hintStyle: TextStyle(color: Colors.grey)),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28, right: 28),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.orange)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    Text("${Constants.pref.getString("city")}"),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.orange)),
                            child: TextFormField(
                              controller: _address,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Address / સરનામું",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        widget.isVoter
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 28, right: 28),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Constants.pref
                                                  .getString("partNo") ==
                                              "null"
                                          ? TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _partNo,
                                              validator: (_partNo) {
                                                var numValue =
                                                    int.tryParse(_partNo);
                                                if (_partNo.isEmpty) {
                                                  return "Please enter Part No.";
                                                } else if (numValue >= 351) {
                                                  return "Enter less than 350";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Word Part No. / વોર્ડ ભાગ નં.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            )
                                          : Text(
                                              "${Constants.pref.getString("partNo")}"),
                                    )),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.orange)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _partNo,
                                    validator: (_partNo) {
                                      var numValue = int.tryParse(_partNo);
                                      if (_partNo.isEmpty) {
                                        return "Please enter Part No.";
                                      } else if (numValue >= 351) {
                                        return "Enter less than 350";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Word Part No. / વોર્ડ ભાગ નં.",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        widget.isVoter
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 28, right: 28),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.orange)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Constants.pref
                                                  .getString("voter_id") ==
                                              "null"
                                          ? TextFormField(
                                              controller: _voterId,
                                              validator: (_voterId) {
                                                if (_voterId.isEmpty) {
                                                  return "Please enter Voter Id";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Voter ID No / મતદાન કાર્ડ નં.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey)),
                                            )
                                          : Text(
                                              "${Constants.pref.getString("voter_id")}"),
                                    )),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.orange)),
                                  child: TextFormField(
                                    controller: _voterId,
                                    validator: (_voterId) {
                                      if (_voterId.isEmpty) {
                                        return "Please enter Voter Id";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            "Voter ID No / મતદાન કાર્ડ નં.",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.orange)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Item>(
                              hint: Text("   Select the blood groups"),
                              value: selectedBloodGroup,
                              onChanged: (Item Value) {
                                setState(() {
                                  selectedBloodGroup = Value;
                                });
                              },
                              items: bloodGroupList.map((Item user) {
                                return DropdownMenuItem<Item>(
                                  value: user,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      user.name,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.orange)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Item>(
                              hint: Text("   Select Designation"),
                              value: selectedDesignation,
                              onChanged: (Item Value) {
                                setState(() {
                                  selectedDesignation = Value;
                                });
                              },
                              items: designationList.map((Item user) {
                                return DropdownMenuItem<Item>(
                                  value: user,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      user.name,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.orange)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text("   Select Vidhansabha Name"),
                              onChanged: (value) {
                                setState(() {
                                  selectedVidhansabha = value;
                                });
                              },
                              value: selectedVidhansabha,
                              items: vidhanshaList.map((user) {
                                return DropdownMenuItem(
                                  value: user['vidhansabha_name'],
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      user['vidhansabha_name'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }).toList(),
                              // onChanged: (newVal) {
                              //   setState(() {
                              //     selectedVidhansabha = newVal;
                              //   });
                              // },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 0,
                              height: 0,
                            ),
                            _image(),
                            Positioned(
                              top: 100,
                              right: 40,
                              child: IconButton(
                                  onPressed: () {
                                    _showdialog(context);
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo,
                                  )),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: InkWell(
                            onTap: () async {
                              // pr.show();
                              if (_formKey.currentState.validate()) {
                                //  pr.hide();
                                bool success = await _formApi.submitDetails(
                                    bloodGroup: selectedBloodGroup.name ?? "",
                                    createdBy:
                                        Constants.pref.getString("operator"),
                                    designation: selectedDesignation.name ?? "",
                                    city: Constants.pref.getString("city"),
                                    img: img ?? "",
                                    fname: Constants.pref
                                            .getString("first_name") ??
                                        _name.text,
                                    serialNo:
                                        Constants.pref.getString("serial_no") ??
                                            _serialNo.text,
                                    wardName: _wardName.text,
                                    wardNo: selectedWard?.name ?? _wardNo.text,
                                    wardPartNo:
                                        Constants.pref.getString("partNo") ??
                                            _partNo.text,
                                    localityId: _address.text,
                                    dob: _dob.text,
                                    dom: _dom.text,
                                    mobNo: _mobNo.text,
                                    pageNo: _pageNo.text,
                                    idCardNo:
                                        Constants.pref.getString("voter_id") ??
                                            _voterId.text);
                                if (success) {
                                  //  pr.hide();
                                  _showSuccessDialog();
                                }
                                // pr.hide();
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.green,
                                        Colors.orange,
                                      ])),
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),
        ));
  }
}

class Item {
  const Item(this.name);
  final String name;
}
