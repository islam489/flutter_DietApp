// To parse this JSON data, do
//
//     final getGovernorate = getGovernorateFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

GetGovernorate getGovernorateFromJson(String str) =>
    GetGovernorate.fromJson(json.decode(str));

String getGovernorateToJson(GetGovernorate data) => json.encode(data.toJson());

class GetGovernorate {
  GetGovernorate({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  int responseCode;
  String responseMessage;
  List<ResponseGovernorateData> responseData;

  factory GetGovernorate.fromJson(Map<String, dynamic> json) => GetGovernorate(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseGovernorateData>.from(json["responseData"]
            .map((x) => ResponseGovernorateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class ResponseGovernorateData {
  ResponseGovernorateData({
    this.govId,
    this.govCode,
    this.govNameE,
    this.govNameA,
    this.areas,
    this.areaId,
    this.areaCode,
    this.areaNameE,
    this.areaNameA,
  });

  int govId;
  String govCode;
  String govNameE;
  String govNameA;
  int areaId;
  String areaCode;
  String areaNameE;
  String areaNameA;
   List<Area> areas;

  factory ResponseGovernorateData.fromJson(Map<String, dynamic> json) {
  
    return    ResponseGovernorateData(
        govId: json["govId"],
        govCode: json["govCode"],
        govNameE: json["govNameE"],
        govNameA: json["govNameA"],
        areaId: json["areaId"],
        areaCode: json["areaCode"],
        areaNameE: json["areaNameE"],
        areaNameA: json["areaNameA"],
         areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
      );
  }
  Map<String, dynamic> toJson() => {
        "govId": govId,
        "govCode": govCode,
        "govNameE": govNameE,
        "govNameA": govNameA,
        "areaId": areaId,
        "areaCode": areaCode,
        "areaNameE": areaNameE,
        "areaNameA": areaNameA,
         "areas": List<dynamic>.from(areas.map((x) => x.toJson())),
      };
}

class Area {
    Area({
        this.areaId,
        this.areaCode,
        this.areaNameE,
        this.areaNameA,
        this.govId,
    });

    int areaId;
    String areaCode;
    String areaNameE;
    String areaNameA;
    int govId;

    factory Area.fromJson(Map<String, dynamic> json)
    
    
    { return Area(
        areaId: json["areaId"],
        areaCode: json["areaCode"],
        areaNameE: json["areaNameE"],
        areaNameA: json["areaNameA"],
        govId: json["govId"],
    );} 

    Map<String, dynamic> toJson() => {
        "areaId": areaId,
        "areaCode": areaCode,
        "areaNameE": areaNameE,
        "areaNameA": areaNameA,
        "govId": govId,
    };
}
