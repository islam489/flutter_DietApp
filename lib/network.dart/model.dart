// To parse this JSON data, do
//
//     final getAllPackageModel = getAllPackageModelFromJson(jsonString);

import 'dart:convert';

GetAllPackageModel getAllPackageModelFromJson(String str) =>
    GetAllPackageModel.fromJson(json.decode(str));

String getAllPackageModelToJson(GetAllPackageModel data) =>
    json.encode(data.toJson());

class GetAllPackageModel {
  GetAllPackageModel({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  int responseCode;
  String responseMessage;
  List<ResponseDatum> responseData;

  factory GetAllPackageModel.fromJson(Map<String, dynamic> json) =>
      GetAllPackageModel(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseDatum>.from(
            json["responseData"].map((x) => ResponseDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class ResponseDatum {
  ResponseDatum({
    this.membershipId,
    this.nameAr,
    this.nameEn,
    this.price,
    this.duration,
    this.note,
    this.image,
    this.imageInside,
    this.membershipTypesModel,
    this.membershipTypes,
  });

  int membershipId;
  String nameAr;
  String nameEn;
  String price;
  String duration;
  String note;
  String image;
  String imageInside;
  List<MembershipType> membershipTypesModel;
  List<MembershipType> membershipTypes;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
        membershipId: json["membershipId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        price: json["price"],
        duration: json["duration"],
        note: json["note"],
        image: json["image"],
        imageInside: json["imageInside"],
        membershipTypesModel: json["MembershipTypesModel"] == null
            ? null
            : List<MembershipType>.from(json["MembershipTypesModel"]
                .map((x) => MembershipType.fromJson(x))),
        membershipTypes: json["membershipTypes"] == null
            ? null
            : List<MembershipType>.from(
                json["membershipTypes"].map((x) => MembershipType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "membershipId": membershipId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "price": price,
        "duration": duration,
        "note": note,
        "image": image,
        "imageInside": imageInside,
        "MembershipTypesModel": membershipTypesModel == null
            ? null
            : List<dynamic>.from(membershipTypesModel.map((x) => x.toJson())),
        "membershipTypes": membershipTypes == null
            ? null
            : List<dynamic>.from(membershipTypes.map((x) => x.toJson())),
      };
}

class MembershipType {
  MembershipType({
    this.id,
    this.membershipId,
    this.titleEn,
    this.titleAr,
    this.dayCount,
    this.price,
    this.discEnable,
    this.notes,
    this.image,
    this.imageInside,
    this.duration,
  });

  int id;
  int membershipId;
  String titleEn;
  String imageInside;
  String note;
  String titleAr;
  int dayCount;
  String price;
  bool discEnable;
  String notes;
  String image;
  String duration;

  factory MembershipType.fromJson(Map<String, dynamic> json) => MembershipType(
        id: json["id"],
        membershipId: json["membershipId"],
        titleEn: json["nameEn"],
        titleAr: json["titleAr"],
        dayCount: json["dayCount"],
        price: json["price"],
        discEnable: json["discEnable"],
        notes: json["note"],
        image: json["image"],
        imageInside:json["imageInside"],
        duration:json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "membershipId": membershipId,
        "titleEn": titleEn,
        "titleAr": titleAr,
        "dayCount": dayCount,
        "price": price,
        "discEnable": discEnable,
        "notes": note,
        "image": image,
        "imageInside":imageInside,
        "duration":duration,
      };
}
