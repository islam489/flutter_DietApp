import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/medicalData.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/newMedicaldata.dart';
import 'package:flutter_application_1/screens.dart/updateMedicalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';
import 'drawer_scaffold.dart';

class MyMedicalData extends StatefulWidget {
  static final route = 'mymedicaldata';

  @override
  _MyMedicalDataState createState() => _MyMedicalDataState();
}

class _MyMedicalDataState extends State<MyMedicalData> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

  API api = new API();
  List<ResponseMedicalData> medicalDataItem = [];

  Future<List<ResponseMedicalData>> loadMedicalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return medicalDataItem =
        await api.fetchMedicalData(prefs.getInt("clientId"));
  }

  @override
  void initState() {
    super.initState();
    loadMedicalData();
    print('88888888888');
  }

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
    return DrawerScaffold(
      key: _keyDrawer,
      drawer: AppDrawer(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    InkWell(
                        onTap: () => _keyDrawer.currentState.openCloseDrawer(),
                        child: Icon(
                          Icons.menu,
                          color: Colors.purple[200],
                        )),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 155,
                      width: 200,
                      child: Image.asset("assets/images/header.png"),
                    ),
                    Spacer(),
                    SizedBox(width: 25),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 42,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'My Medical Data',
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
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple[200])),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    // ignore: missing_required_param
                    child: FutureBuilder<List<ResponseMedicalData>>(
                      future: loadMedicalData(),
                      builder: (context, snapshot) {
                        print(snapshot.data.toString());
                        if (snapshot.hasData) {
                          print('qqqqqqqqqqqqqqqqqqqqqqqq');
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                return Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: Colors.purple[200])),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft * .9,
                                        padding:
                                            EdgeInsets.only(top: 25, left: 13),
                                        height: 150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' Date : ${snapshot.data[i].createAt}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              ' Weight : ${snapshot.data[i].weight}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              ' Height : ${snapshot.data[i].height}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              ' Target Weight : ${snapshot.data[i].targetWeight}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                      if (i == 0)
                                        FloatingActionButton(
                                          heroTag: 'one',
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                UpdateMedicalData.route,
                                                arguments:
                                                    snapshot.data[i]);
                                                          

                                          },
                                          child: Icon(
                                            Icons.system_update_alt,
                                            size: 35,
                                          ),
                                          backgroundColor: Colors.purple[200],
                                        ),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'two',
          onPressed: () {
            Navigator.of(context).pushNamed(NewMedicalData.route);
          },
          child: Icon(
            Icons.add,
            size: 35,
          ),
          backgroundColor: Colors.purple[200],
        ),
      ),
    );
  }
}
