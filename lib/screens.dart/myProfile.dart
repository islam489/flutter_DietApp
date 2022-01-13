import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/profile.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer_scaffold.dart';

class MyProfile extends StatefulWidget {
  static final route = 'myprofile';

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name;
  String mobile;
  String email;
  String civilNo;
  String _myActivity;
  String _myActivityResult;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

  final dateController = TextEditingController();
  List<String> items = ['Select Gender', 'male', 'Female'];
  String dropValue = 'Select Gender';

  API api = new API();
  //List<ResponseProfileData> profileDataItem = [];

  Future<GetMyProfile> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await api.fetchProfileData(prefs.getInt("clientId"));
  }

  Future<GetMyProfile> profileDataFuture;
  @override
  void initState() {
    profileDataFuture = loadProfileData();
    super.initState();
    print('profileeeeeeeeeeeeeeeeee');
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  _saveForm() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  void updateUserData() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      API.updateProfileData(name, mobile, email, civilNo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      key: _keyDrawer,
      drawer: AppDrawer(),
      child: Scaffold(
        //body
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 25),
                  InkWell(
                      onTap: () => _keyDrawer.currentState.openCloseDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Colors.purple[200],
                      )),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/header.png"),
                  ),
                  Spacer(),
                  SizedBox(width: 25),
                ],
              ),
              Container(
                width: 300,
                height: 42,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Text(
                  'My Profile',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.purple[200],
                    border: Border.all(
                      color: Colors.purple[200],
                      width: 5,
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.purple[200])),

                //form
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.53,
                  //width: MediaQuery.of(context).size.width * 0.5,
                  child: FutureBuilder<GetMyProfile>(
                      future: profileDataFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return Form(
                          key: _formKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(height: 5),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        //controller: nameController,
                                        initialValue: snapshot
                                            .data.responseData.holderNameE,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15, top: 11, right: 15),
                                        ),
                                        keyboardType: TextInputType.name,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                          name = value;
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Name!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Mobile',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        // controller: nameController,
                                        //
                                        initialValue:
                                            snapshot.data.responseData.mobile,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15, top: 11, right: 15),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                          mobile = value;
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Number!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        // controller: nameController,
                                        //
                                        initialValue: snapshot
                                            .data.responseData.emailAddress,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15, top: 11, right: 15),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                          email = value;
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Email!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Civil No',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        // controller: nameController,
                                        //
                                        initialValue:
                                            snapshot.data.responseData.civilId,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15, top: 11, right: 15),
                                        ),
                                        keyboardType: TextInputType.number,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                          civilNo = value;
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Civil No!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Expanded(
                                      child: Card(
                                        elevation: 0,
                                        child: DropdownButton<String>(
                                          value: dropValue,
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.expand_more,
                                            color: Color(0xFF007AE7),
                                          ),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 0,
                                            color: Colors.purple,
                                          ),
                                          onChanged: (String newValue) async {
                                            setState(() {
                                              dropValue = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Select Gender',
                                            'male',
                                            'female'
                                          ].map<DropdownMenuItem<String>>((e) {
                                            return DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e),
                                            );
                                          }).toList(),
                                          /*.map<DropdownMenuItem<String>>((newValue) {
                                return DropdownMenuItem<String>(
                                  value: newValue,
                                  child: Text(newValue),
                                );
                              }).toList(),*/
                                        ),
                                      ),
                                      /*child: DropDownFormField(
                                      titleText: 'Select Government',
                                      //  hintText: 'hhhhhh',
                                      value: _myActivity,
                                      onSaved: (value) {
                                        setState(() {
                                          _myActivity = value;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _myActivity = value;
                                        });
                                      },
                                      dataSource: [
                                        {
                                          "display": "Female",
                                          "value": "Female",
                                        },
                                        {
                                          "display": "Male",
                                          "value": "Male",
                                        },
                                      ],
                                      textField: 'display',
                                      valueField: 'value',
                                    ),*/
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.0),
                                    side: BorderSide(color: Colors.purple)),
                                elevation: 4.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Birth date',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                          readOnly: true,
                                          controller: dateController,
                                          decoration: InputDecoration(
                                            labelText: 'Select date',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15, top: 11, right: 15),
                                          ),
                                          onTap: () async {
                                            var date = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100));
                                            dateController.text = date
                                                .toString()
                                                .substring(0, 10);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.purple,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Container(
                                  width: 200,
                                  height: 42,
                                  child: RaisedButton(
                                    color: Colors.purple[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      updateUserData();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
