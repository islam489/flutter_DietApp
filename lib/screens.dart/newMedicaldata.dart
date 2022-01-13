import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myMedicaldata.dart';

class NewMedicalData extends StatefulWidget {
  static final route = 'newmedicaldata';

  @override
  _NewMedicalDataState createState() => _NewMedicalDataState();
}

class _NewMedicalDataState extends State<NewMedicalData> {
  final _formKey = GlobalKey<FormState>();
  final medicalkey = GlobalKey<ScaffoldState>();
  TextEditingController clientIdController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();

  /* @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }*/

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      print('we here for check');
    } else {
      print('we not here ');
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: medicalkey,
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
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: 42,
              padding: EdgeInsets.all(5),
              child: Text(
                'New Medical Data',
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
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.purple)),

              //form
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                //width: MediaQuery.of(context).size.width * 0.5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: BorderSide(color: Colors.purple)),
                        elevation: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Text(
                              'Height',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[200]),
                              textAlign: TextAlign.start,
                            )),
                            Flexible(
                              child: TextFormField(
                                controller: heightController,
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Colors.purple[200]),
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
                                    return 'Enter a valid number!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: BorderSide(color: Colors.purple)),
                        elevation: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Text(
                              'Weight',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[200]),
                              textAlign: TextAlign.start,
                            )),
                            Flexible(
                              child: TextFormField(
                                controller: weightController,
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Colors.purple[200]),
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
                                    return 'Enter a valid number!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: BorderSide(color: Colors.purple)),
                        elevation: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Text(
                              'Target Weight',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[200]),
                              textAlign: TextAlign.start,
                            )),
                            Flexible(
                              child: TextFormField(
                                controller: targetWeightController,
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: Colors.purple[200]),
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
                                    return 'Enter a valid number!';
                                  }
                                  return null;
                                },
                              ),
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                Map<String, dynamic> data;
                                data = await API.addMedicalData(
                                    weightController.text,
                                    heightController.text,
                                    targetWeightController.text);
                                print("addddddddddddddddddd");
                                if (data["responseCode"] == 200) {
                                  //  SharedPreferences prefs =
                                      //  await SharedPreferences.getInstance();
                                      //  prefs.setInt('userId', data['responseData']['userId']);
                                  //if(data.isNotEmpty){
                                  print("data medical");
                                  Navigator.of(context)
                                      .pushNamed(MyMedicalData.route);
                                } else {
                                  print("add medical data faild");
                                  medicalkey.currentState.showSnackBar(SnackBar(
                                    content: Text('add medical data faild'),
                                  ));
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
