// To parse this JSON data, do
//
//     final getMedicalData = getMedicalDataFromJson(jsonString);

import 'dart:convert';

GetMedicalData getMedicalDataFromJson(String str) => GetMedicalData.fromJson(json.decode(str));

String getMedicalDataToJson(GetMedicalData data) => json.encode(data.toJson());

class GetMedicalData {
    GetMedicalData({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    int responseCode;
    String responseMessage;
    List<ResponseMedicalData> responseData;

    factory GetMedicalData.fromJson(Map<String, dynamic> json) => GetMedicalData(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseMedicalData>.from(json["responseData"].map((x) => ResponseMedicalData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
    };
}

class ResponseMedicalData {
    ResponseMedicalData({
        this.medicalId,
        this.mealDetailId,
        this.clientId,
        this.weight,
        this.height,
        this.targetWeight,
        this.disLikes,
        this.likes,
        this.createAt,
        this.customerMealPortion,
    });

    int medicalId;
    int mealDetailId;
    int clientId;
    int weight;
    int height;
    int targetWeight;
    String disLikes;
    String likes;
    DateTime createAt;
    dynamic customerMealPortion;

    factory ResponseMedicalData.fromJson(Map<String, dynamic> json) => ResponseMedicalData(
        medicalId: json["medicalId"].toInt(),
        mealDetailId: json["mealDetailId"].toInt(),
        clientId: json["clientId"].toInt(),
        weight: json["weight"].toInt(),
        height: json["height"].toInt(),
        targetWeight: json["targetWeight"].toInt(),
        disLikes: json["disLikes"],
        likes: json["likes"],
        createAt: DateTime.parse(json["createAt"]),
        customerMealPortion: json["customerMealPortion"],
    );

    Map<String, dynamic> toJson() => {
        "medicalId": medicalId,
        "mealDetailId": mealDetailId,
        "clientId": clientId,
        "weight": weight,
        "height": height,
        "targetWeight": targetWeight,
        "disLikes": disLikes,
        "likes": likes,
        "createAt": createAt.toIso8601String(),
        "customerMealPortion": customerMealPortion,
    };
}
