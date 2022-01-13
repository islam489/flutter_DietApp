import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/network.dart/termscondition.dart';
import 'package:flutter_application_1/screens.dart/drawer.dart';

import 'drawer_scaffold.dart';

class TermsConditions extends StatefulWidget {
  static final route = 'terms&conditions';

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

  API api = new API();
  TermsAndCondition terms;

  Future<TermsAndCondition> loadTermsAndConditions() async {
    return terms = await api.fetchTermsAndCondition();
  }

  @override
  void initState() {
    super.initState();
    loadTermsAndConditions();
    print('1010101010101010');
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
                  SizedBox(width: 25),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: InkWell(
                        onTap: () => _keyDrawer.currentState.openCloseDrawer(),
                        child: Icon(
                          Icons.menu,
                          color: Colors.purple[200],
                        )),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/header.png"),
                  ),
                  Spacer(),
                  SizedBox(width: 25),
                ],
              ),
              Container(
                width: 325,
                height: 42,
                //   margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Terms&Conditions',
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
              Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<TermsAndCondition>(
                  future: loadTermsAndConditions(),
                  builder: (context, snapshot) {
                    print(snapshot.data.toString());
                    if (snapshot.hasData) {
                      //  print('kkkkk');
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: MediaQuery.of(context).size.width * .9,
                        child: Text(
                          snapshot.data.responseData.policyPrivacyData,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15,
                          ),
                        ),
                      );
                    } else {
                          return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
