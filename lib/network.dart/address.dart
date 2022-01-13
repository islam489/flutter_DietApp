// To parse this JSON data, do
//
//     final getGovernorate = getGovernorateFromJson(jsonString);

import 'dart:convert';

GetGovernorate getGovernorateFromJson(String str) => GetGovernorate.fromJson(json.decode(str));

String getGovernorateToJson(GetGovernorate data) => json.encode(data.toJson());

class GetGovernorate {
    GetGovernorate({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    int responseCode;
    String responseMessage;
    List<ResponseAddressData> responseData;

    GetGovernorate copyWith({
        int responseCode,
        String responseMessage,
        List<ResponseAddressData> responseData,
    }) => 
        GetGovernorate(
            responseCode: responseCode ?? this.responseCode,
            responseMessage: responseMessage ?? this.responseMessage,
            responseData: responseData ?? this.responseData,
        );

    factory GetGovernorate.fromJson(Map<String, dynamic> json) => GetGovernorate(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: List<ResponseAddressData>.from(json["responseData"].map((x) => ResponseAddressData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
    };
}

class ResponseAddressData {
    ResponseAddressData({
        this.id,
        this.masterId,
        this.areaCode,
        this.plotCode,
        this.street,
        this.avenueCode,
        this.buildingNo,
        this.floorNo,
        this.apartmentNo,
        this.address,
        this.notes,
        this.selected,
        this.addedBy,
        this.addedDate,
        this.syncToMachines,
        this.days,
        this.governorateCode,
        this.govNameEn,
        this.areaNameEn,
        this.govNameAr,
        this.areaNameAr,
    });

    int id;
    int masterId;
    int areaCode;
    int plotCode;
    String street;
    String avenueCode;
    String buildingNo;
    String floorNo;
    String apartmentNo;
    dynamic address;
    dynamic notes;
    String selected;
    String addedBy;
    DateTime addedDate;
    String syncToMachines;
    String days;
    int governorateCode;
    String govNameEn;
    String areaNameEn;
    String govNameAr;
    String areaNameAr;

    ResponseAddressData copyWith({
        int id,
        int masterId,
        int areaCode,
        int plotCode,
        String street,
        String avenueCode,
        String buildingNo,
        String floorNo,
        String apartmentNo,
        dynamic address,
        dynamic notes,
        String selected,
        String addedBy,
        DateTime addedDate,
        String syncToMachines,
        String days,
        int governorateCode,
        String govNameEn,
        String areaNameEn,
        String govNameAr,
        String areaNameAr,
    }) => 
        ResponseAddressData(
            id: id ?? this.id,
            masterId: masterId ?? this.masterId,
            areaCode: areaCode ?? this.areaCode,
            plotCode: plotCode ?? this.plotCode,
            street: street ?? this.street,
            avenueCode: avenueCode ?? this.avenueCode,
            buildingNo: buildingNo ?? this.buildingNo,
            floorNo: floorNo ?? this.floorNo,
            apartmentNo: apartmentNo ?? this.apartmentNo,
            address: address ?? this.address,
            notes: notes ?? this.notes,
            selected: selected ?? this.selected,
            addedBy: addedBy ?? this.addedBy,
            addedDate: addedDate ?? this.addedDate,
            syncToMachines: syncToMachines ?? this.syncToMachines,
            days: days ?? this.days,
            governorateCode: governorateCode ?? this.governorateCode,
            govNameEn: govNameEn ?? this.govNameEn,
            areaNameEn: areaNameEn ?? this.areaNameEn,
            govNameAr: govNameAr ?? this.govNameAr,
            areaNameAr: areaNameAr ?? this.areaNameAr,
        );

    factory ResponseAddressData.fromJson(Map<String, dynamic> json) => ResponseAddressData(
        id: json["id"],
        masterId: json["masterId"],
        areaCode: json["areaCode"],
        plotCode: json["plotCode"],
        street: json["street"],
        avenueCode: json["avenueCode"] == null ? null : json["avenueCode"],
        buildingNo: json["buildingNo"],
        floorNo: json["floorNo"],
        apartmentNo: json["apartmentNo"],
        address: json["address"],
        notes: json["notes"],
        selected: json["selected"],
        addedBy: json["addedBy"] == null ? null : json["addedBy"],
        addedDate: json["addedDate"] == null ? null : DateTime.parse(json["addedDate"]),
        syncToMachines: json["syncToMachines"] == null ? null : json["syncToMachines"],
        days: json["days"] == null ? null : json["days"],
        governorateCode: json["governorateCode"],
        govNameEn: json["govNameEn"],
        areaNameEn: json["areaNameEn"],
        govNameAr: json["govNameAr"],
        areaNameAr: json["areaNameAr"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "masterId": masterId,
        "areaCode": areaCode,
        "plotCode": plotCode,
        "street": street,
        "avenueCode": avenueCode == null ? null : avenueCode,
        "buildingNo": buildingNo,
        "floorNo": floorNo,
        "apartmentNo": apartmentNo,
        "address": address,
        "notes": notes,
        "selected": selected,
        "addedBy": addedBy == null ? null : addedBy,
        "addedDate": addedDate == null ? null : addedDate.toIso8601String(),
        "syncToMachines": syncToMachines == null ? null : syncToMachines,
        "days": days == null ? null : days,
        "governorateCode": governorateCode,
        "govNameEn": govNameEn,
        "areaNameEn": areaNameEn,
        "govNameAr": govNameAr,
        "areaNameAr": areaNameAr,
    };
}
