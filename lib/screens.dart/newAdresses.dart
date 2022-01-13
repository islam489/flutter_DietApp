import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/governorateandArea.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/myAdreeses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAdresses extends StatefulWidget {
  static final route = 'newadresses';

  @override
  _NewAdressesState createState() => _NewAdressesState();
}

class _NewAdressesState extends State<NewAdresses> {
  String _myActivity;
  String _myActivityResult;
  final _formKey = GlobalKey<FormState>();
  final addresskey = GlobalKey<ScaffoldState>();
  final dateController = TextEditingController();
  List<String> items = ['Select Government', 'Select Area'];
  String dropValue = 'Select Government';
  String dropValue2 = 'Select Area';

  TextEditingController governorateController = TextEditingController();
  TextEditingController blockController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController avenueController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController apartNoController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  API api = new API();
  List<ResponseGovernorateData> governorateDataItem = [];

  Future<List<ResponseGovernorateData>> loadGovernorateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return governorateDataItem = await api.fetchGovernorateData();
  }

  Future<List<ResponseGovernorateData>> governorateDataFuture;
  @override
  void initState() {
    governorateDataFuture = api.fetchGovernorateData();
    super.initState();
    print('88888888888');
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

  List<bool> isChecked = [false, false, false, false, false, false, false];

  var resultHolder = 'Checkbox is UN-CHECKED';

  void toggleCheckbox(bool value, int currentChecked) {
    for (int i = 0; i < isChecked.length; i++) {
      /*if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
      });
    }*/
      if (i == currentChecked) {
        setState(() {
          isChecked[i] = value;
        });
      }
    }
  }

  List<String> text = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];
  final areas = <Area>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.purple[200],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/header.png"),
                ),
                SizedBox(width: 5),
              ],
            ),
            Container(
              width: 300,
              height: 42,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Text(
                'New Adress',
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
                  color: Colors.purple,
                  border: Border.all(
                    color: Colors.purple,
                    width: 5,
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.purple)),

              //form
              child: Container(
                height: MediaQuery.of(context).size.height * 0.71,
                //width: MediaQuery.of(context).size.width * 0.5,

                child: Form(
                  key: _formKey,
                  child: FutureBuilder<List<ResponseGovernorateData>>(
                      future: governorateDataFuture,
                      builder: (context, snapshot) {
                        //  print('areas=>${governorateData?.first?.areas?.first?.toJson()}');
                        if (snapshot.hasData) {
                          final governorateData = snapshot?.data ?? [];
                          return Column(
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
                                      'Government',
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
                                            'Select Government',
                                            ...governorateData
                                                .map((e) => e.govNameE)
                                          ].map<DropdownMenuItem<String>>((e) {
                                            return DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e),
                                              onTap: () {
                                                final governorate =
                                                    governorateData
                                                        .where((element) =>
                                                            element.govNameE ==
                                                            e)
                                                        .first;

                                                governorateController.text =
                                                    governorate.govId.toString();
                                                setState(() {
                                                  areas.clear();
                                                  areas.addAll(
                                                      governorate.areas);
                                                });
                                              },
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
                                      'Area',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Expanded(
                                      child: Card(
                                        elevation: 0,
                                        child: DropdownButton<String>(
                                          value: dropValue2,
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
                                              dropValue2 = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Select Area',
                                            ...areas
                                                .toSet()
                                                .map((e) => e?.areaNameE ?? '')
                                          ].map<DropdownMenuItem<String>>((e) {
                                            return DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e ?? ''),
                                              onTap: () {
                                                areaController.text = areas
                                                    .where((element) =>
                                                        element.areaNameE == e)
                                                    .first
                                                    .areaId.toString();
                                              },
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
                                      'Block',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: blockController,
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
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Number!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Flexible(
                                        child: Text(
                                      'Avenue',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: avenueController,
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
                                      'Street',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: streetController,
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
                                            TextInputType.streetAddress,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Number!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Flexible(
                                        child: Text(
                                      'House No',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: houseNoController,
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
                                      'Floor No',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: floorNoController,
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
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Number!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Flexible(
                                        child: Text(
                                      'Apart No',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: apartNoController,
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
                                      'Notes',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    Flexible(
                                      child: TextFormField(
                                        controller: notesController,
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
                                        // keyboardType: TextInputType.,
                                        autofocus: true,
                                        onFieldSubmitted: (value) {
                                          //Validator
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid Notes!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      side: BorderSide(color: Colors.purple)),
                                  elevation: 4.0,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Days',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      // ignore: missing_required_param
                                      Wrap(children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[0],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 0);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'sat',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[1],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 1);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'sun',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[2],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 2);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'mon',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[3],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 3);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'tue',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[4],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 4);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'wed',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[5],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 5);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'thu',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: isChecked[6],
                                                onChanged: (value) {
                                                  toggleCheckbox(value, 6);
                                                },
                                                activeColor: Colors.purple[200],
                                                checkColor: Colors.white,
                                                tristate: false,
                                              ),
                                              Text(
                                                'fri',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
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
                                    color: Colors.purple,
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
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        Map<String, dynamic> data;
                                        data = await API.addNewAddress(
                                          governorateController.text,
                                          areaController.text,
                                          floorNoController.text,
                                          apartNoController.text,
                                          notesController.text,
                                          blockController.text,
                                          avenueController.text,
                                          streetController.text,
                                          houseNoController.text,
                                        );
                                        print("addddddddddddddddddd");
                                        if (data["responseCode"] == 200) {
                                          print("data address sucsses");
                                          Navigator.of(context)
                                              .pushNamed(MyAdresses.route);
                                        } else {
                                          print("add address data faild");
                                          addresskey.currentState
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('add address data faild'),
                                          ));
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Container();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
