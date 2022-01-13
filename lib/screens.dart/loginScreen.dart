import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/forgetPassword.dart';
import 'package:flutter_application_1/screens.dart/packagesScreen.dart';
import 'package:flutter_application_1/screens.dart/signupScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static final route = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final loginkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      key: loginkey,
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/header.png"),
              ),
            ),
            SizedBox(
              height: 50,
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
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Log In ",
                            style: TextStyle(
                                fontSize: 24.0, color: Colors.purple[200]),
                          ),
                        ),
                        //styling

                        Card(
                          elevation: 4.0,
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Mobile',
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
                          elevation: 4.0,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.purple[200]),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 11, right: 15),
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
                                "Log In",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  Map<String, dynamic> data;
                                  data = await API.login(nameController.text,
                                      passwordController.text);
                                  print("islammmmmmmmmmmm");
                                  if (data["responseCode"] == 200) {
                                  
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                        prefs.setInt('clientId', data['responseData']['clientId']);
                                  
                                    //if(data.isNotEmpty){
                                    print("islam");
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            Packages.route, (route) => false);
                                  } else {
                                    print("login faild");
                                    loginkey.currentState.showSnackBar(SnackBar(
                                      backgroundColor: Colors.purple[200],
                                      margin: EdgeInsets.all(50),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      content: Text(
                                        'Sorry, username or password is not correct.',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ));
                                    /* return  Fluttertoast.showToast(
                                        msg: "Sorry, username or password is not correct.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.purple[200],
                                        textColor: Colors.white,
                                        fontSize: 16.0);*/
                                  }
                                }
                              },
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(SignUp.route);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.purple[200]),
                                )),
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(ForgetPassword.route);
                                },
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.purple[200]),
                                )),
                          ],
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
