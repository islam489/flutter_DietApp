
// To parse this JSON data, do
//
//     final getCarousel = getCarouselFromJson(jsonString);

import 'dart:convert';

GetCarousel getCarouselFromJson(String str) => GetCarousel.fromJson(json.decode(str));

String getCarouselToJson(GetCarousel data) => json.encode(data.toJson());

class GetCarousel {
    GetCarousel({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    int responseCode;
    String responseMessage;
    List<ResponseDatu> responseData;

    factory GetCarousel.fromJson(Map<String, dynamic> json) => GetCarousel(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseDatu>.from(json["responseData"].map((x) => ResponseDatu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
    };
}

class ResponseDatu {
    ResponseDatu({
        this.id,
        this.titleEn,
        this.titleAr,
        this.imagePath,
        this.packageId,
        this.sortOrder,
        this.vaildFrom,
        this.vaildTo,
    });

    int id;
    String titleEn;
    String titleAr;
    String imagePath;
    int packageId;
    int sortOrder;
    String vaildFrom;
    String vaildTo;

    factory ResponseDatu.fromJson(Map<String, dynamic> json) => ResponseDatu(
        id: json["id"],
        titleEn: json["titleEn"],
        titleAr: json["titleAr"],
        imagePath: json["imagePath"],
        packageId: json["packageId"],
        sortOrder: json["sortOrder"],
        vaildFrom: json["vaildFrom"],
        vaildTo: json["vaildTo"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titleEn": titleEn,
        "titleAr": titleAr,
        "imagePath": imagePath,
        "packageId": packageId,
        "sortOrder": sortOrder,
        "vaildFrom": vaildFrom,
        "vaildTo": vaildTo,
    };
}
