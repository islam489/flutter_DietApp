import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/address.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/newAdresses.dart';
import 'package:flutter_application_1/screens.dart/updateAddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';
import 'drawer_scaffold.dart';

class MyAdresses extends StatefulWidget {
  static final route = 'myadresses';

  @override
  _MyAdressesState createState() => _MyAdressesState();
}

class _MyAdressesState extends State<MyAdresses> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

  API api = new API();
  List<ResponseAddressData> addressData = [];

  Future<List<ResponseAddressData>> loadAddressData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return addressData = await api.fetchMyAddress(prefs.getInt("clientId"));
  }

  @override
  void initState() {
    super.initState();
    loadAddressData();
    print('Address11111111111111');
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
        //body
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
                    'My Addresses',
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
                    child: FutureBuilder<List<ResponseAddressData>>(
                      future: loadAddressData(),
                      builder: (context, snapshot) {
                        print(snapshot.data.toString() + "islam");
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
                                        height: 155,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' Gov : ${snapshot.data[i].govNameEn}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' Area : ${snapshot.data[i].areaNameEn}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' Avenu : ${snapshot.data[i].avenueCode}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' PlotCode : ${snapshot.data[i].plotCode}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' Days : ${snapshot.data[i].days}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              ' Street : ${snapshot.data[i].street}',
                                              style: TextStyle(
                                                  color: Colors.purple[200],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              UpdateAdresses.route,
                                              arguments: snapshot.data[i]);
                                        },
                                        heroTag: Text("btn1"),
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
          onPressed: () {
            Navigator.of(context).pushNamed(NewAdresses.route);
          },
          heroTag: 'address',
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
