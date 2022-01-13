import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/drawer.dart';

import 'drawer_scaffold.dart';

class ChangePassword extends StatefulWidget {
  static final route = 'changepassword';

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

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
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/header.png"),
                  ),
                  Spacer(),
                  SizedBox(width: 25),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Card(
                margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.purple)),
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 3.0),
                  //form
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Change Password ",
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.purple),
                            ),
                          ),
                          //styling
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Card(
                            elevation: 4.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                labelStyle: TextStyle(color: Colors.purple),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {},
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                            ),
                          ),

                          //box styling
                          SizedBox(
                            height: 15,
                          ),
                          //text input
                          Card(
                            elevation: 4.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                labelStyle: TextStyle(color: Colors.purple),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {},
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            elevation: 4.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirmed Password',
                                labelStyle: TextStyle(color: Colors.purple),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {},
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            color: Colors.purple,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Container(
                              width: double.infinity,
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
                                  "Change",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  _submit();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
