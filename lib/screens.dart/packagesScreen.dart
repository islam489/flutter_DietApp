import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/carousel.dart';
import 'package:flutter_application_1/network.dart/medicalData.dart';
import 'package:flutter_application_1/network.dart/model.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/screens.dart/changePassword.dart';
import 'package:flutter_application_1/screens.dart/drawer.dart';
import 'package:flutter_application_1/screens.dart/mySubscriptions.dart';
import 'package:flutter_application_1/screens.dart/newMedicaldata.dart';
import 'package:flutter_application_1/screens.dart/newAdresses.dart';
import 'package:flutter_application_1/screens.dart/myProfile.dart';
import 'package:flutter_application_1/screens.dart/terms&conditions.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer_scaffold.dart';
import 'myMedicaldata.dart';

class Packages extends StatefulWidget {
  static final route = 'packages';

  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  List<MembershipType> data = [];
  //List<ResponseDatu> data1 = [];
  List<ResponseDatu> swiperData = [];
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();
  API api = new API();

  Future<List<MembershipType>> loadData() async {
    return data = await api.fetchPackage();

    // setState(() {});
    // print(data.length.toString() + " lllllllllllllllllll ");
  }

  Future<List<ResponseDatu>> loadData1() async {
    print(swiperData.length.toString() + " lllllllllllllllllll ");
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

    return swiperData = await api.fetchCarousel();
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadData1();
    print('999999999999999999999');
  }
  

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      key: _keyDrawer,
      drawer: AppDrawer(),
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Row(
              children: [
                SizedBox(width: 10),
                InkWell(
                    onTap: () => _keyDrawer.currentState.openCloseDrawer(),
                    child: Icon(
                      Icons.menu,
                      color: Colors.purple[200],
                    )),
                Spacer(),
                Image.asset(
                  "assets/images/header.png",
                  height: 100,
                  width: 200,
                ),
                Spacer(),
                SizedBox(width: 25),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: FutureBuilder<List<ResponseDatu>>(
              future: loadData1(),
              builder: (context, snapshot) {
                print(snapshot.data.toString());
                print('XYZZZZZZZZZZZZZZZZZZZZZZZ');
                if (snapshot.hasData) {
                  // return ListView.builder(
                  //  itemCount: 2,
                  // itemBuilder: (context, i) {

                  // });
                  return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * .97,
                      /* child: Swiper(
                      itemWidth: MediaQuery.of(context).size.width * .97,
                      itemHeight: 100,
                      containerHeight: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          snapshot.data[index].imagePath,
                          fit: BoxFit.cover,
                         //width: double.infinity,
                          height: 150,
                          
                        );
                      },
                      autoplay: true,
                      autoplayDisableOnInteraction: true,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                      itemCount: snapshot.data.length,
                      pagination: new SwiperPagination(
                          alignment: Alignment.bottomCenter),
                      //control: new SwiperControl(),
                    ),*/
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          reverse: true,
                          viewportFraction: 1.0,
                          aspectRatio: 1.5,
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Image.network(
                          snapshot.data[itemIndex].imagePath,
                          fit: BoxFit.cover,
                          //width: double.infinity,
                          height: 150,
                        ),
                      ));
                } else if (snapshot.hasError) {
                  return Text('it has an error');
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<List<MembershipType>>(
                future: loadData(),
                builder: (context, snapshot) {
                  print(snapshot.data.toString());
                  if (snapshot.hasData) {
                    //  print('kkkkk');
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                                //borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.purple[200])),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data[i].titleEn == null
                                              ? ''
                                              : snapshot.data[i].titleEn,
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          snapshot.data[i].notes == null
                                              ? ''
                                              : snapshot.data[i].notes,
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          '${snapshot.data[i].duration} Days ' ==
                                                  null
                                              ? ''
                                              : '${snapshot.data[i].duration} Days',
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          '${snapshot.data[i].price} KD ' ==
                                                  null
                                              ? ''
                                              : '${snapshot.data[i].price} KD',
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    snapshot.data[i].image == null
                                        ? Container()
                                        : Image.network(snapshot.data[i].image,
                                            height: 165, width: 75),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                      color: Colors.purple[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 15.0,
                                      ),
                                      child: Text(
                                        "Join",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {}),
                                ),
                                SizedBox(height: 10),
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
      )),
    );
  }
}

/* FutureBuilder<List<MembershipType>>(
              future: loadData(),
              builder: (context, snapshot) {
                print(snapshot.data.toString());
                if (snapshot.hasData) {
                //  print('kkkkk');
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        snapshot.data[i].titleEn,
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        snapshot.data[i].notes,
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${snapshot.data[i].duration} Days ',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${snapshot.data[i].price} KD ',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.network(
                                      "http://185.19.76.8:63766//images/MainImages/54af2a94-6830-4ab0-a3a8-2f8ec27bac61.jpg",
                                      height: 150,
                                      width: 100),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
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
                                      "Join",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {}),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      });
                } else {
                  return SizedBox(height: 0);
                }
              },
            ),*/

// A build function returned null.
