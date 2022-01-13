// To parse this JSON data, do
//
//     final getMyProfile = getMyProfileFromJson(jsonString);

import 'dart:convert';

GetMyProfile getMyProfileFromJson(String str) => GetMyProfile.fromJson(json.decode(str));

String getMyProfileToJson(GetMyProfile data) => json.encode(data.toJson());

class GetMyProfile {
    GetMyProfile({
        this.responseCode,
        this.responseMessage,
        this.responseData,
    });

    num responseCode;
    String responseMessage;
    ResponseProfileData responseData;

    factory GetMyProfile.fromJson(Map<String, dynamic> json) => GetMyProfile(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        responseData: ResponseProfileData.fromJson(json["responseData"]),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "responseData": responseData.toJson(),
    };
}

class ResponseProfileData {
    ResponseProfileData({
        this.id,
        this.code,
        this.fundCode,
        this.holderName,
        this.familyName,
        this.holderNameE,
        this.familyNameE,
        this.status,
        this.sex,
        this.surname,
        this.paperType,
        this.paperNo,
        this.familyFundNo,
        this.civilId,
        this.barcode,
        this.startingDt,
        this.sharesValue,
        this.sharesQty,
        this.sessionNo,
        this.expireDt,
        this.positionCode,
        this.purchaseAmount,
        this.lastPurchaseDt,
        this.bankCode,
        this.birthday,
        this.deathDt,
        this.profitFlg,
        this.loadingFlg,
        this.areaCode,
        this.plotCode,
        this.street,
        this.avenueCode,
        this.buildingNo,
        this.apartmentNo,
        this.floorNo,
        this.telephone,
        this.mobile,
        this.emailAddress,
        this.boxNo,
        this.boxArea,
        this.zipCode,
        this.workAddress,
        this.workAddress2,
        this.workAddress3,
        this.notes,
        this.recieveCode,
        this.localResd,
        this.isMain,
        this.openingQty,
        this.openingValue,
        this.openingDate,
        this.addedBy,
        this.addedDate,
        this.accChartId,
        this.accountNo,
        this.msType,
        this.msBarcode,
        this.trn,
        this.contactPerson,
        this.companyName,
        this.catId,
        this.maxDiscPerc,
        this.driverId,
        this.nationalityId,
        this.syncToMachines,
        this.driver,
        this.nationality,
        this.dietMessage,
        this.dietRejectedRecipe,
        this.dietSubscription,
        this.msMasterAddresses,
        this.msMasterMedicalInfo,
    });

    num id;
    String code;
    dynamic fundCode;
    dynamic holderName;
    dynamic familyName;
    String holderNameE;
    dynamic familyNameE;
    dynamic status;
    String sex;
    dynamic surname;
    dynamic paperType;
    dynamic paperNo;
    dynamic familyFundNo;
    String civilId;
    dynamic barcode;
    dynamic startingDt;
    dynamic sharesValue;
    dynamic sharesQty;
    dynamic sessionNo;
    dynamic expireDt;
    dynamic positionCode;
    dynamic purchaseAmount;
    dynamic lastPurchaseDt;
    dynamic bankCode;
    dynamic birthday;
    dynamic deathDt;
    dynamic profitFlg;
    dynamic loadingFlg;
    dynamic areaCode;
    dynamic plotCode;
    dynamic street;
    dynamic avenueCode;
    dynamic buildingNo;
    dynamic apartmentNo;
    dynamic floorNo;
    dynamic telephone;
    String mobile;
    String emailAddress;
    dynamic boxNo;
    dynamic boxArea;
    dynamic zipCode;
    dynamic workAddress;
    dynamic workAddress2;
    dynamic workAddress3;
    dynamic notes;
    dynamic recieveCode;
    dynamic localResd;
    dynamic isMain;
    dynamic openingQty;
    dynamic openingValue;
    dynamic openingDate;
    dynamic addedBy;
    dynamic addedDate;
    dynamic accChartId;
    dynamic accountNo;
    num msType;
    dynamic msBarcode;
    dynamic trn;
    dynamic contactPerson;
    dynamic companyName;
    dynamic catId;
    dynamic maxDiscPerc;
    num driverId;
    dynamic nationalityId;
    dynamic syncToMachines;
    Driver driver;
    dynamic nationality;
    List<dynamic> dietMessage;
    List<dynamic> dietRejectedRecipe;
    List<dynamic> dietSubscription;
    List<dynamic> msMasterAddresses;
    List<MsMasterMedicalInfo> msMasterMedicalInfo;

    factory ResponseProfileData.fromJson(Map<String, dynamic> json) => ResponseProfileData(
        id: json["id"],
        code: json["code"],
        fundCode: json["fundCode"],
        holderName: json["holderName"],
        familyName: json["familyName"],
        holderNameE: json["holderNameE"],
        familyNameE: json["familyNameE"],
        status: json["status"],
        sex: json["sex"],
        surname: json["surname"],
        paperType: json["paperType"],
        paperNo: json["paperNo"],
        familyFundNo: json["familyFundNo"],
        civilId: json["civilId"],
        barcode: json["barcode"],
        startingDt: json["startingDt"],
        sharesValue: json["sharesValue"],
        sharesQty: json["sharesQty"],
        sessionNo: json["sessionNo"],
        expireDt: json["expireDt"],
        positionCode: json["positionCode"],
        purchaseAmount: json["purchaseAmount"],
        lastPurchaseDt: json["lastPurchaseDt"],
        bankCode: json["bankCode"],
        birthday: json["birthday"],
        deathDt: json["deathDt"],
        profitFlg: json["profitFlg"],
        loadingFlg: json["loadingFlg"],
        areaCode: json["areaCode"],
        plotCode: json["plotCode"],
        street: json["street"],
        avenueCode: json["avenueCode"],
        buildingNo: json["buildingNo"],
        apartmentNo: json["apartmentNo"],
        floorNo: json["floorNo"],
        telephone: json["telephone"],
        mobile: json["mobile"],
        emailAddress: json["emailAddress"],
        boxNo: json["boxNo"],
        boxArea: json["boxArea"],
        zipCode: json["zipCode"],
        workAddress: json["workAddress"],
        workAddress2: json["workAddress2"],
        workAddress3: json["workAddress3"],
        notes: json["notes"],
        recieveCode: json["recieveCode"],
        localResd: json["localResd"],
        isMain: json["isMain"],
        openingQty: json["openingQty"],
        openingValue: json["openingValue"],
        openingDate: json["openingDate"],
        addedBy: json["addedBy"],
        addedDate: json["addedDate"],
        accChartId: json["accChartId"],
        accountNo: json["accountNo"],
        msType: json["msType"],
        msBarcode: json["msBarcode"],
        trn: json["trn"],
        contactPerson: json["contactPerson"],
        companyName: json["companyName"],
        catId: json["catId"],
        maxDiscPerc: json["maxDiscPerc"],
        driverId: json["driverId"],
        nationalityId: json["nationalityId"],
        syncToMachines: json["syncToMachines"],
        driver: Driver.fromJson(json["driver"]),
        nationality: json["nationality"],
        dietMessage: List<dynamic>.from(json["dietMessage"].map((x) => x)),
        dietRejectedRecipe: List<dynamic>.from(json["dietRejectedRecipe"].map((x) => x)),
        dietSubscription: List<dynamic>.from(json["dietSubscription"].map((x) => x)),
        msMasterAddresses: List<dynamic>.from(json["msMasterAddresses"].map((x) => x)),
        msMasterMedicalInfo: List<MsMasterMedicalInfo>.from(json["msMasterMedicalInfo"].map((x) => MsMasterMedicalInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "fundCode": fundCode,
        "holderName": holderName,
        "familyName": familyName,
        "holderNameE": holderNameE,
        "familyNameE": familyNameE,
        "status": status,
        "sex": sex,
        "surname": surname,
        "paperType": paperType,
        "paperNo": paperNo,
        "familyFundNo": familyFundNo,
        "civilId": civilId,
        "barcode": barcode,
        "startingDt": startingDt,
        "sharesValue": sharesValue,
        "sharesQty": sharesQty,
        "sessionNo": sessionNo,
        "expireDt": expireDt,
        "positionCode": positionCode,
        "purchaseAmount": purchaseAmount,
        "lastPurchaseDt": lastPurchaseDt,
        "bankCode": bankCode,
        "birthday": birthday,
        "deathDt": deathDt,
        "profitFlg": profitFlg,
        "loadingFlg": loadingFlg,
        "areaCode": areaCode,
        "plotCode": plotCode,
        "street": street,
        "avenueCode": avenueCode,
        "buildingNo": buildingNo,
        "apartmentNo": apartmentNo,
        "floorNo": floorNo,
        "telephone": telephone,
        "mobile": mobile,
        "emailAddress": emailAddress,
        "boxNo": boxNo,
        "boxArea": boxArea,
        "zipCode": zipCode,
        "workAddress": workAddress,
        "workAddress2": workAddress2,
        "workAddress3": workAddress3,
        "notes": notes,
        "recieveCode": recieveCode,
        "localResd": localResd,
        "isMain": isMain,
        "openingQty": openingQty,
        "openingValue": openingValue,
        "openingDate": openingDate,
        "addedBy": addedBy,
        "addedDate": addedDate,
        "accChartId": accChartId,
        "accountNo": accountNo,
        "msType": msType,
        "msBarcode": msBarcode,
        "trn": trn,
        "contactPerson": contactPerson,
        "companyName": companyName,
        "catId": catId,
        "maxDiscPerc": maxDiscPerc,
        "driverId": driverId,
        "nationalityId": nationalityId,
        "syncToMachines": syncToMachines,
        "driver": driver.toJson(),
        "nationality": nationality,
        "dietMessage": List<dynamic>.from(dietMessage.map((x) => x)),
        "dietRejectedRecipe": List<dynamic>.from(dietRejectedRecipe.map((x) => x)),
        "dietSubscription": List<dynamic>.from(dietSubscription.map((x) => x)),
        "msMasterAddresses": List<dynamic>.from(msMasterAddresses.map((x) => x)),
        "msMasterMedicalInfo": List<dynamic>.from(msMasterMedicalInfo.map((x) => x.toJson())),
    };
}

class Driver {
    Driver({
        this.driverId,
        this.nameAr,
        this.nameEn,
        this.mobile,
        this.status,
        this.email,
        this.addedBy,
        this.addedDate,
        this.distributionCost,
        this.msMaster,
    });

    num driverId;
    String nameAr;
    String nameEn;
    dynamic mobile;
    String status;
    dynamic email;
    dynamic addedBy;
    dynamic addedDate;
    dynamic distributionCost;
    List<dynamic> msMaster;

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverId: json["driverId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        mobile: json["mobile"],
        status: json["status"],
        email: json["email"],
        addedBy: json["addedBy"],
        addedDate: json["addedDate"],
        distributionCost: json["distributionCost"],
        msMaster: List<dynamic>.from(json["msMaster"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "mobile": mobile,
        "status": status,
        "email": email,
        "addedBy": addedBy,
        "addedDate": addedDate,
        "distributionCost": distributionCost,
        "msMaster": List<dynamic>.from(msMaster.map((x) => x)),
    };
}

class MsMasterMedicalInfo {
    MsMasterMedicalInfo({
        this.id,
        this.subscriptionId,
        this.clientId,
        this.dieticianId,
        this.weight,
        this.bodyFat,
        this.height,
        this.targetWeight,
        this.heighestWeight,
        this.lowestWeight,
        this.hipCircumference,
        this.waistCircumference,
        this.muscleMass,
        this.bmi,
        this.targetBmi,
        this.waistHipFat,
        this.waistToHipPercent,
        this.waterRate,
        this.vegeterianFlag,
        this.isSmoking,
        this.smokingNotes,
        this.isAlkohol,
        this.alkoholNotes,
        this.isExercies,
        this.exerciesNotes,
        this.mealNotes,
        this.remarks,
        this.physicalActivityLevel,
        this.addedBy,
        this.addedDate,
        this.dailyCalories,
        this.medicalCondition,
        this.consultationNote,
        this.portion,
        this.visitTypeId,
        this.client,
        this.dietician,
        this.subscription,
    });

    num id;
    dynamic subscriptionId;
    num clientId;
    dynamic dieticianId;
    num weight;
    dynamic bodyFat;
    num height;
    num targetWeight;
    dynamic heighestWeight;
    dynamic lowestWeight;
    dynamic hipCircumference;
    dynamic waistCircumference;
    dynamic muscleMass;
    dynamic bmi;
    dynamic targetBmi;
    dynamic waistHipFat;
    dynamic waistToHipPercent;
    dynamic waterRate;
    dynamic vegeterianFlag;
    dynamic isSmoking;
    dynamic smokingNotes;
    dynamic isAlkohol;
    dynamic alkoholNotes;
    dynamic isExercies;
    dynamic exerciesNotes;
    dynamic mealNotes;
    dynamic remarks;
    dynamic physicalActivityLevel;
    String addedBy;
    DateTime addedDate;
    num dailyCalories;
    dynamic medicalCondition;
    dynamic consultationNote;
    num portion;
    num visitTypeId;
    dynamic client;
    dynamic dietician;
    dynamic subscription;

    factory MsMasterMedicalInfo.fromJson(Map<String, dynamic> json) => MsMasterMedicalInfo(
        id: json["id"],
        subscriptionId: json["subscriptionId"],
        clientId: json["clientId"],
        dieticianId: json["dieticianId"],
        weight: json["weight"],
        bodyFat: json["bodyFat"],
        height: json["height"],
        targetWeight: json["targetWeight"],
        heighestWeight: json["heighestWeight"],
        lowestWeight: json["lowestWeight"],
        hipCircumference: json["hipCircumference"],
        waistCircumference: json["waistCircumference"],
        muscleMass: json["muscleMass"],
        bmi: json["bmi"],
        targetBmi: json["targetBmi"],
        waistHipFat: json["waistHipFat"],
        waistToHipPercent: json["waistToHipPercent"],
        waterRate: json["waterRate"],
        vegeterianFlag: json["vegeterianFlag"],
        isSmoking: json["isSmoking"],
        smokingNotes: json["smokingNotes"],
        isAlkohol: json["isAlkohol"],
        alkoholNotes: json["alkoholNotes"],
        isExercies: json["isExercies"],
        exerciesNotes: json["exerciesNotes"],
        mealNotes: json["mealNotes"],
        remarks: json["remarks"],
        physicalActivityLevel: json["physicalActivityLevel"],
        addedBy: json["addedBy"],
        addedDate: DateTime.parse(json["addedDate"]),
        dailyCalories: json["dailyCalories"] == null ? null : json["dailyCalories"],
        medicalCondition: json["medicalCondition"],
        consultationNote: json["consultationNote"],
        portion: json["portion"] == null ? null : json["portion"],
        visitTypeId: json["visitTypeId"] == null ? null : json["visitTypeId"],
        client: json["client"],
        dietician: json["dietician"],
        subscription: json["subscription"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subscriptionId": subscriptionId,
        "clientId": clientId,
        "dieticianId": dieticianId,
        "weight": weight,
        "bodyFat": bodyFat,
        "height": height,
        "targetWeight": targetWeight,
        "heighestWeight": heighestWeight,
        "lowestWeight": lowestWeight,
        "hipCircumference": hipCircumference,
        "waistCircumference": waistCircumference,
        "muscleMass": muscleMass,
        "bmi": bmi,
        "targetBmi": targetBmi,
        "waistHipFat": waistHipFat,
        "waistToHipPercent": waistToHipPercent,
        "waterRate": waterRate,
        "vegeterianFlag": vegeterianFlag,
        "isSmoking": isSmoking,
        "smokingNotes": smokingNotes,
        "isAlkohol": isAlkohol,
        "alkoholNotes": alkoholNotes,
        "isExercies": isExercies,
        "exerciesNotes": exerciesNotes,
        "mealNotes": mealNotes,
        "remarks": remarks,
        "physicalActivityLevel": physicalActivityLevel,
        "addedBy": addedBy,
        "addedDate": addedDate.toIso8601String(),
        "dailyCalories": dailyCalories == null ? null : dailyCalories,
        "medicalCondition": medicalCondition,
        "consultationNote": consultationNote,
        "portion": portion == null ? null : portion,
        "visitTypeId": visitTypeId == null ? null : visitTypeId,
        "client": client,
        "dietician": dietician,
        "subscription": subscription,
    };
}
