class QrScanPaid {
  int? status;
  String? message;
  List<QrScanPaidModel> data;

  QrScanPaid(
      {required this.status, required this.message, required this.data});
  factory QrScanPaid.fromJson(Map<String, dynamic> json) => QrScanPaid(
    status: json["status"],
    message: json["message"],
    data: List<QrScanPaidModel>.from(
        json["data"].map((x) => QrScanPaidModel.fromJson(x))),
  );
}

class QrScanPaidModel {
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

  QrScanPaidModel(
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
  factory QrScanPaidModel.fromJson(Map<String, dynamic> json) =>
      QrScanPaidModel(
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
