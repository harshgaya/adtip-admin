class QrScanCompany {
  int? status;
  String? message;
  List<QrScanCompanyModel> data;

  QrScanCompany(
      {required this.status, required this.message, required this.data});
  factory QrScanCompany.fromJson(Map<String, dynamic> json) => QrScanCompany(
        status: json["status"],
        message: json["message"],
        data: List<QrScanCompanyModel>.from(
            json["data"].map((x) => QrScanCompanyModel.fromJson(x))),
      );
}

class QrScanCompanyModel {
  int? companyId;
  String? companyName;

  QrScanCompanyModel({required this.companyId, required this.companyName});
  factory QrScanCompanyModel.fromJson(Map<String, dynamic> json) =>
      QrScanCompanyModel(
        companyId: json['company_id'],
        companyName: json['company_name'],
      );
}
