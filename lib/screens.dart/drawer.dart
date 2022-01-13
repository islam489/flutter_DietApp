

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens.dart/myAdreeses.dart';
import 'package:flutter_application_1/screens.dart/packagesScreen.dart';
import 'package:flutter_application_1/screens.dart/terms&conditions.dart';
/*import 'package:flutter_social_content_share/flutter_social_content_share.dart';*/
import 'package:url_launcher/url_launcher.dart';

import 'changePassword.dart';
import 'myMedicaldata.dart';
import 'myProfile.dart';
import 'mySubscriptions.dart';
import 'newAdresses.dart';


class AppDrawer extends StatefulWidget {

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _platformVersion = 'Unknown';

   @override
  void initState() {
    super.initState();
   /* initPlatformState();*/
  }
   // Platform messages are asynchronous, so we initialize in an async method.
 /* Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterSocialContentShare.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }*/


 /* /// SHARE ON FACEBOOK CALL
  shareOnFacebook() async {
    String result = await FlutterSocialContentShare.share(
        type: ShareType.facebookWithoutImage,
        url: "https://www.facebook.com/DietAddress",
        quote: "captions");
    print(result);
  }

  /// SHARE ON INSTAGRAM CALL
  shareOnInstagram() async {
    String result = await FlutterSocialContentShare.share(
        type: ShareType.instagramWithImageUrl,
        imageUrl:
            "https://post.healthline.com/wp-content/uploads/2020/09/healthy-eating-ingredients-732x549-thumbnail-732x549.jpg");
    print(result);
  }

  /// SHARE ON WHATSAPP CALL
  shareWatsapp() async {
    String result = await FlutterSocialContentShare.shareOnWhatsapp(
        "0000000", "Text Appear hear");
    print(result);
  }

  /// SHARE ON EMAIL CALL
  shareEmail() async {
    String result = await FlutterSocialContentShare.shareOnEmail(
        recipients: ["xxxx.xxx@gmail.com"],
        subject: "Subject appears here",
        body: "Body appears here",
        isHTML: true); //default isHTML: False
    print(result);
  }

  /// SHARE ON SMS CALL
  shareSMS() async {
    String result = await FlutterSocialContentShare.shareOnSMS(
        recipients: ["xxxxxx"], text: "Text appears here");
    print(result);
  }*/

  @override
  Widget build(BuildContext context) {
    return  Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.purple[200])),
            borderOnForeground: true,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  //child: Center(child:Text('Header Area')),
                  child: Image.asset("assets/images/header.png"),

                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      ),
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/diet_packages.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('DietPackage',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Packages.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/my current package.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('My Current Package',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Packages.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/MY SUBSCRIPTION.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('My Subscription',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MySubscriptions.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.purple[200],
                  child: Text('MY PROFIlE',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/myprofile.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('My Profile',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyProfile.route,
                           (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/my_addresses.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('My Adresses',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyAdresses.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/medical_data.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Medical Data',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyMedicalData.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/medical_data.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Terms & Condition',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          TermsConditions.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/password change.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Change Password',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          ChangePassword.route, (route) => false);
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/logout.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Log Out',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.purple[200],
                  child: Text('GEt IN TOUCH',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/phonelogo.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Call Us ',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/whatsapp.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('WhatsApp Us',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/gmail.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Email Us',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.purple[200],
                  child: Text('LETS GET SOCIAL',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/facebook.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Facebook',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {
                     /* shareOnFacebook();*/
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/twitter.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Twitter',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/instagram.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 15),
                        Text('Instagram',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                        SizedBox(width: MediaQuery.of(context).size.width * .1),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.purple[200],
                  child: Text('       Copyright @thedietaddress - 2020   ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                Divider(
                  color: Colors.white,
                  height: .5,
                  thickness: .5,
                ),
              ],
            ),
          ),
        );
  }
 
}