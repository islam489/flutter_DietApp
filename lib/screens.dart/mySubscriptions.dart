import 'package:flutter/material.dart';
import 'package:flutter_application_1/network.dart/service.dart';
import 'package:flutter_application_1/network.dart/subscription.dart';
import 'package:flutter_application_1/screens.dart/drawer.dart';

import 'drawer_scaffold.dart';

class MySubscriptions extends StatefulWidget {
  static final route = 'subscriptions';

  @override
  _MySubscriptionsState createState() => _MySubscriptionsState();
}

class _MySubscriptionsState extends State<MySubscriptions> {
  GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

  API api = new API();
  List<ResponseDataSubscription> subscriptionItem = [];

  Future<List<ResponseDataSubscription>> loadSubscriptions() async {
    return subscriptionItem = await api.fetchSubscriptions();
  }

  @override
  void initState() {
    super.initState();
    loadSubscriptions();
    print('777777777777777');
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
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width * .5,
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
                  'My Subscriptions',
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
                child: FutureBuilder<List<ResponseDataSubscription>>(
                  future: loadSubscriptions(),
                  builder: (context, snapshot) {
                    print(snapshot.data.toString());
                    if (snapshot.hasData) {
                      print('kkkkk');
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: Colors.purple[200])),
                              child: Container(
                                alignment: Alignment.topLeft * .9,
                                padding: EdgeInsets.only(top: 25, left: 13),
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data[i].membership,
                                          style: TextStyle(
                                              color: Colors.purple[200],
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '( ${snapshot.data[i].status} )',
                                          style: TextStyle(
                                              color: Colors.purple[200],
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      ' Days Count : ${snapshot.data[i].daysCount}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
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
