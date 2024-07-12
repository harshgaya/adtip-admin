class QrScanUnpaid {
  int? status;
  String? message;
  List<QrScanUnpaidModel> data;

  QrScanUnpaid(
      {required this.status, required this.message, required this.data});
  factory QrScanUnpaid.fromJson(Map<String, dynamic> json) => QrScanUnpaid(
        status: json["status"],
        message: json["message"],
        data: List<QrScanUnpaidModel>.from(
            json["data"].map((x) => QrScanUnpaidModel.fromJson(x))),
      );
}

class QrScanUnpaidModel {
  int? id;
  String? companyName;
  int? companyId;
  String? adName;
  int? adId;
  String? date;
  String? userName;
  int? userId;
  int? mobile;
  String? upiId;
  String? profession;

  QrScanUnpaidModel(
      {required this.id,
      required this.companyId,
      required this.companyName,
      required this.adName,
      required this.adId,
      required this.date,
      required this.userName,
      required this.userId,
      required this.profession,
      required this.upiId,
      required this.mobile});
  factory QrScanUnpaidModel.fromJson(Map<String, dynamic> json) =>
      QrScanUnpaidModel(
        companyId: json['company_id'],
        companyName: json['company_name'],
        id: json['id'],
        adName: json['ad_name'],
        adId: json['ad_id'],
        date: json['created_date'],
        userName: json['user_name'],
        userId: json['user_id'],
        profession: json['profession'],
        upiId: json['upi_id'],
        mobile: json['mobile_no'],
      );
}
