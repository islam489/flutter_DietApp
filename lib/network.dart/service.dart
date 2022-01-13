import 'dart:convert';
import 'package:flutter_application_1/network.dart/address.dart';
import 'package:flutter_application_1/network.dart/governorateandArea.dart';
import 'package:flutter_application_1/network.dart/profile.dart';
import 'package:flutter_application_1/network.dart/subscription.dart';
import 'package:flutter_application_1/network.dart/termscondition.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'carousel.dart';
import 'medicalData.dart';
import 'model.dart';

class API {
  static const String url =
      'http://185.19.76.8:63769/api/AdministratorMob/UserLogIn';

  static Future<Map<String, dynamic>> login(
      String userName, String password) async {
    final Response response = await post(url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "UserName": userName,
          "Password": password,
        }));
    if (response.statusCode == 200) {
      print(response.body);
      print('ggggg');
      //  var _login= Login.fromJson(json.decode(response.body));
      //  print(_login.userName);
      //  print('*******************');
      return json.decode(response.body);
      // return response.body;

    } else {
      throw Exception('can not reload');
    }
  }

  Future<List<MembershipType>> fetchPackage() async {
    String url1 =
        'http://185.19.76.8:63769/api/DietMembershipMob/GetDietMemberships';

    try {
      final Response response = await get(url1);
      //  print(response.body);
      //  print("sssssssssssssssssssssssssssss");
      List pdfItem = json.decode(response.body)["responseData"];
      return pdfItem.map((e) => MembershipType.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ResponseDatu>> fetchCarousel() async {
    String url2 =
        'http://185.19.76.8:63769/api/DietOfferCarouselMob/GetDietOfferCarousel';

    try {
      final Response response = await get(url2);
      print(response.body);
      print("cccccccccccccccccc");
      List pdfItem = json.decode(response.body)["responseData"];
      return pdfItem.map((e) => ResponseDatu.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  /*Future <List<TermsAndCondition>>fetchTermsAndCondition()async{
   String url4='http://185.19.76.8:63769/api/DietPolicyPrivacy/GetDietPolicyPrivacy/';
 
    try{
      final Response response=await get(url4);
        print(response.body);
        print("TTTTTTTTTTTTTT");
       List termsconditions = json.decode(response.body)["responseData"]['responseData'];
        return termsconditions.map((e) => TermsAndCondition.fromJson(e)).toList();
  

    }
    catch(e) {
      print(e.toString());
    }
  }*/

  Future<TermsAndCondition> fetchTermsAndCondition() async {
    String url4 =
        'http://185.19.76.8:63769/api/DietPolicyPrivacy/GetDietPolicyPrivacy/';

    try {
      final response = await get(url4);

      final termsconditions = json.decode(response.body);
      return TermsAndCondition.fromJson(termsconditions);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ResponseDataSubscription>> fetchSubscriptions() async {
    String url5 =
        'http://185.19.76.8:63769/api/DietSubscriptionMob/GetDietCustomerSubscriptions/0';

    try {
      final Response response = await get(url5);
      print(response.body);
      print("SSSSSSSSSSSSSSS");
      List subscriptionData = json.decode(response.body)["responseData"];
      return subscriptionData
          .map((e) => ResponseDataSubscription.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  static const String url3 =
      'http://185.19.76.8:63769/api/DietCustomerMob/PostCustomerMedicalData';

  static Future<Map<String, dynamic>> addMedicalData(
      String weight, String height, String targetWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(
        'clientId1111=>${(prefs.getInt('clientId') ?? 0)} weight=>$weight height=>$height  targetWeight=>$targetWeight ');
    final Response response = await post(url3,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ClientId": (prefs.getInt('clientId') ?? 0),
          "Weight": weight,
          "Height": height,
          "TargetWeight": targetWeight,
        }));
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      print('ffffffffffffffff');
      return json.decode(response.body);

    } else {
      throw Exception('can not reload');
    }
  }

  static const String url6 =
      'http://185.19.76.8:63769/api/DietCustomerMob/UpdateCustomerMedicalData';

  static Future<Map<String, dynamic>> updateMedicalData(
      String weight, String height, String targetWeight, int medicalId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(
        'clientId=>${(prefs.getInt('userId') ?? 0)} medicalId=>$medicalId  weight=>$weight height=>$height  targetWeight=>$targetWeight ');

    final Response response = await put(url6,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ClientId": (prefs.getInt('userId') ?? 0),
          "medicalId": medicalId,
          "Weight": weight,
          "Height": height,
          "TargetWeight": targetWeight,
        }));
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      print('uuuuuuuuuuuuuu');

      return json.decode(response.body);
    } else {
      throw Exception('can not reload');
    }
  }

  Future<List<ResponseMedicalData>> fetchMedicalData(int id) async {
    String url7 =
        'http://185.19.76.8:63769/api/DietCustomerMob/GetCustomerMedicalData/$id';

    try {
      final Response response = await get(url7);
      print(response.body);
      print("DDDDDDDDDDDD");
      List medicalData = json.decode(response.body)["responseData"];
      return medicalData.map((e) => ResponseMedicalData.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GetMyProfile> fetchProfileData(int id) async {
    String url8 = 'http://185.19.76.8:63769/api/MsMaster/$id';

    try {
      final Response response = await get(url8);
      print(response.body);
      print("DDDDDDDDDDDD");

      return getMyProfileFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  static const String url9 =
      'http://185.19.76.8:63769/api/DietCustomerMob/UpdateCustomerDataMob';

  static Future<Map<String, dynamic>> updateProfileData(
    String clientName,
    String mobile,
    String email,
    String civilId,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(
        'clientId=>${(prefs.getInt('userId') ?? 0)}   mobile=>$mobile email=>$email  clientName=>$clientName  civilId=>$civilId');

    final Response response = await put(url9,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ClientId": (prefs.getInt('userId') ?? 0),
          "Mobile": mobile,
          "Email": email,
          "CivilId": civilId,
          "ClientName": clientName,
        }));
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      print('update Profileeeee data');

      return json.decode(response.body);
    } else {
      throw Exception('profile data can not reload');
    }
  }

  Future<List<ResponseAddressData>> fetchMyAddress(int id) async {
    String url10 =
        'http://185.19.76.8:63769/api/DietCustomerAddressesMob/GetCustomerAddresses/$id';
//print(url10);
    try {
      final Response response = await get(url10);
      print(response.body);
      print("fetchMyAddress11");
      List myAdressData = json.decode(response.body)["responseData"];
      print("fetchMyAddress22");
      return myAdressData.map((e) => ResponseAddressData.fromJson(e)).toList();
    } catch (e) {
      print(e.toString() + "vv");
    }
  }

  Future<List<ResponseGovernorateData>> fetchGovernorateData() async {
    String url11 =
        'http://185.19.76.8:63769/api/DietCustomerAddressesMob/GetGovernorates/';

    try {
      final Response response = await get(url11);
      print(response.body );
      print("Government and Area");
      List myGovernorateData = json.decode(response.body)["responseData"];
    
      return myGovernorateData
          .map((e) => ResponseGovernorateData.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  static const String url12 =
      'http://185.19.76.8:63769/api/DietCustomerAddressesMob/PostCustomerAddress';

  static Future<Map<String, dynamic>> addNewAddress(
    String governorateCode,
    String areaCode,
    String floorNo,
    String apartmentNo,
    String notes,
    String plotCode,
    String avenueCode,
    String street,
    String buildingNo,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(
        'MasterId=>${(prefs.getInt('clientId') ?? 0)} areaCode=>$areaCode governorateCode=>$governorateCode  floorNo=>$floorNo ');
    final body = json.encode([
      {
        "ClientId": (prefs.getInt('clientId') ?? 0),
        "MasterId": (prefs.getInt('clientId') ?? 0),
        "GovernorateCode": governorateCode,
        "areaCode": areaCode,
        "FloorNo": floorNo,
        "ApartmentNo": apartmentNo,
        "Notes": notes,
        "PlotCode": plotCode,
        "AvenueCode": avenueCode,
        "Street": street,
        "BuildingNo": buildingNo,
      }
    ]);
    print('body=>$body');
    final Response response = await post(url12,
        headers: {'Content-Type': 'application/json'}, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      print('add new address add ');
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('can not reload');
    }
  }

  static const String url13 =
      'http://185.19.76.8:63769/api/DietCustomerAddressesMob/PutCustomerAddress';

  static Future<Map<String, dynamic>> updateNewAddress(
    String governorateCode,
    String areaCode,
    String floorNo,
    String apartmentNo,
    String notes,
    String plotCode,
    String avenueCode,
    String street,
    String buildingNo, ResponseAddressData addressData,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(
        'MasterId=>${(prefs.getInt('MasterId') ?? 0)} areaCode=>$areaCode governorateCode=>$governorateCode  floorNo=>$floorNo ');

    final body = json.encode(
      {
        "MasterId": addressData.masterId,
        "Id": addressData.id,
        "GovernorateCode": governorateCode,
        "areaCode": areaCode,
        "FloorNo": floorNo,
        "ApartmentNo": apartmentNo,
        "Notes": notes,
        "PlotCode": plotCode,
        "AvenueCode": avenueCode,
        "Street": street,
        "BuildingNo": buildingNo,
      }
    );
    print('body=>$body'+"iiiiiiiiiiii");
    final Response response = await put(url13,
        headers: {'Content-Type': 'application/json'}, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      print('update new address update ');
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('can not reload');
    }
  }
}
