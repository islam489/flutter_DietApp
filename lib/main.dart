import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart/changePassword.dart';
import 'package:flutter_application_1/screens.dart/forgetPassword.dart';
import 'package:flutter_application_1/screens.dart/loginScreen.dart';
import 'package:flutter_application_1/screens.dart/myAdreeses.dart';
import 'package:flutter_application_1/screens.dart/myMedicaldata.dart';
import 'package:flutter_application_1/screens.dart/mySubscriptions.dart';
import 'package:flutter_application_1/screens.dart/newMedicaldata.dart';
import 'package:flutter_application_1/screens.dart/newAdresses.dart';
import 'package:flutter_application_1/screens.dart/myProfile.dart';
import 'package:flutter_application_1/screens.dart/packagesScreen.dart';
import 'package:flutter_application_1/screens.dart/signupScreen.dart';
import 'package:flutter_application_1/screens.dart/terms&conditions.dart';
import 'package:flutter_application_1/screens.dart/updateAddress.dart';
import 'package:flutter_application_1/screens.dart/updateMedicalData.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Packages(),
      initialRoute: Login.route,
      routes: {
        Login.route: (context) => Login(),
        SignUp.route: (context) => SignUp(),
        ForgetPassword.route: (context) => ForgetPassword(),
        ChangePassword.route: (context) => ChangePassword(),
        Packages.route: (context) => Packages(),
        MyProfile.route: (context) => MyProfile(),
        NewAdresses.route: (context) => NewAdresses(),
        NewMedicalData.route: (context) => NewMedicalData(),
        UpdateMedicalData.route: (context) => UpdateMedicalData(),
        MyMedicalData.route: (context) => MyMedicalData(),
        MyAdresses.route: (context) => MyAdresses(),
        TermsConditions.route: (context) => TermsConditions(),
        MySubscriptions.route: (context) => MySubscriptions(),
        UpdateAdresses.route: (context) => UpdateAdresses(),
      },
    );
  }
}
