// To parse this JSON data, do
//
//     final subscriptions = subscriptionsFromJson(jsonString);

import 'dart:convert';

Subscriptions subscriptionsFromJson(String str) => Subscriptions.fromJson(json.decode(str));

String subscriptionsToJson(Subscriptions data) => json.encode(data.toJson());

class Subscriptions {
    Subscriptions({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    int responseCode;
    String responseMessage;
    List<ResponseDataSubscription> responseData;

    factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseDataSubscription>.from(json["responseData"].map((x) => ResponseDataSubscription.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
    };
}

class ResponseDataSubscription {
    ResponseDataSubscription({
        this.subscriptionId,
        this.membershipId,
        this.membership,
        this.membershipAr,
        this.status,
        this.contractDate,
        this.startDate,
        this.endDate,
        this.daysCount,
        this.exceptionDays,
        this.dateFreezTo,
    });

    int subscriptionId;
    int membershipId;
    String membership;
    String membershipAr;
    String status;
    DateTime contractDate;
    DateTime startDate;
    DateTime endDate;
    int daysCount;
    dynamic exceptionDays;
    dynamic dateFreezTo;

    factory ResponseDataSubscription.fromJson(Map<String, dynamic> json) => ResponseDataSubscription(
        subscriptionId: json["subscriptionId"],
        membershipId: json["membershipId"],
        membership: json["membership"],
        membershipAr: json["membershipAr"],
        status: json["status"],
        contractDate: DateTime.parse(json["contractDate"]),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        daysCount: json["daysCount"],
        exceptionDays: json["exceptionDays"],
        dateFreezTo: json["dateFreezTo"],
    );

    Map<String, dynamic> toJson() => {
        "subscriptionId": subscriptionId,
        "membershipId": membershipId,
        "membership": membership,
        "membershipAr": membershipAr,
        "status": status,
        "contractDate": contractDate.toIso8601String(),
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "daysCount": daysCount,
        "exceptionDays": exceptionDays,
        "dateFreezTo": dateFreezTo,
    };
}
