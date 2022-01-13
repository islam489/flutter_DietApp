
class Package{
    String userName;
    String titleEn;
    String titleAr;
    int id;
    int membershipId;
    int dayCount;
    double price;
    Package({this.dayCount,this.id,this.membershipId,this.price,this.titleAr,this.titleEn,this.userName});
    factory Package.fromJson(Map<String,dynamic>package)=>Package(
      id: package['id'],
      userName: package['userName'],
      titleEn: package['titleEn'],
      titleAr: package['titleAr'],
      membershipId: package['membershipId'],
      dayCount: package['dayCount'],
      price: package['price']);
    Map<String,dynamic> toJson()=>
    {"id":id, "userName":userName,"titleEn":titleEn,"titleAr":titleAr,"membershipId":membershipId,"dayCount":dayCount,"price":price};
}