import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static final route = 'signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

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
      //body
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.purple[200],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/header.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.purple[200])),
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  //form
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 3.0),
                            child: Text(
                              "Sign Up ",
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.purple[200]),
                            ),
                          ),

                          Card(
                            elevation: 4.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle:
                                    TextStyle(color: Colors.purple[200]),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                                /* enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),*/
                              ),
                              keyboardType: TextInputType.phone,
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid Full Name!';
                                }
                                return null;
                              },
                            ),
                          ),
                          //box styling

                          //text input
                          Card(
                            elevation: 4.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile',
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
                              keyboardType: TextInputType.phone,
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                            ),
                          ),

                          Card(
                            elevation: 4.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '    Weight',
                                      labelStyle:
                                          TextStyle(color: Colors.purple[200]),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    autofocus: true,
                                    onFieldSubmitted: (value) {
                                      //Validator
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a valid Weight!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '  Target Weight',
                                      labelStyle:
                                          TextStyle(color: Colors.purple[200]),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    autofocus: true,
                                    onFieldSubmitted: (value) {
                                      //Validator
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a valid Target Weight!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '   Height',
                                      labelStyle:
                                          TextStyle(color: Colors.purple[200]),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    autofocus: true,
                                    onFieldSubmitted: (value) {
                                      //Validator
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a valid Height!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            /* child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile',
                                labelStyle: TextStyle(color: Colors.purple),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 11, right: 15),
                              ),
                              keyboardType: TextInputType.phone,
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid email!';
                                }
                                return null;
                              },
                            ),*/
                          ),

                          Card(
                            color: Colors.purple[200],
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Container(
                              width: double.infinity,
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
                                  "Register",
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
