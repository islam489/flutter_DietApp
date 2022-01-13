// To parse this JSON data, do
//
//     final termsAndConditions = termsAndConditionsFromJson(jsonString);

import 'dart:convert';

TermsAndCondition termsAndConditionsFromJson(String str) => TermsAndCondition.fromJson(json.decode(str));

String termsAndConditionsToJson(TermsAndCondition data) => json.encode(data.toJson());

class TermsAndCondition {
    TermsAndCondition({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    int responseCode;
    String responseMessage;
    ResponseData responseData;

    factory TermsAndCondition.fromJson(Map<String, dynamic> json) => TermsAndCondition(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: ResponseData.fromJson(json["responseData"]),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": responseData.toJson(),
    };
}

class ResponseData {
    ResponseData({
        this.id,
        this.policyPrivacyData,
    });

    int id;
   String policyPrivacyData;

    factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        id: json["id"],
        policyPrivacyData: json["policyPrivacyData"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "policyPrivacyData": policyPrivacyData,
    };
}
