import 'package:flutter/material.dart';

import 'changePassword.dart';

class ForgetPassword extends StatefulWidget {
  static final route = 'forgetpassword';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, ),
                //form
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Text(
                            "Forget Password ",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.purple[200]),
                          ),
                        ),
                        //styling
                        SizedBox(
                          height:2,
                        ),
                        Card(
                          elevation: 4.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(color: Colors.purple[200]),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 11, right: 15),
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
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        //box styling
                       
                        //text input

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
                                "Send",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ChangePassword.route);
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
    );
  }
}
