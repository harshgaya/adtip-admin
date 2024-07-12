class DemoContact {
  int? status;
  String? message;
  List<DemoContactModel> data = [];
  DemoContact(
      {required this.status, required this.message, required this.data});
  factory DemoContact.fromJson(Map<String, dynamic> json) => DemoContact(
      status: json['status'],
      message: json['message'],
      data: List<DemoContactModel>.from(
          json["data"].map((x) => DemoContactModel.fromJson(x))));
}

class DemoContactModel {
  int? id;
  String? name;
  String? message;
  String? mobile;
  String? type;
  String? time;
  String? companyName;
  String? country;

  DemoContactModel({
    required this.id,
    required this.name,
    required this.message,
    required this.type,
    required this.companyName,
    required this.mobile,
    required this.country,
    required this.time,
  });
  factory DemoContactModel.fromJson(Map<String, dynamic> json) =>
      DemoContactModel(
        id: json['id'],
        name: json['name'],
        message: json['message'],
        type: json['type'],
        companyName: json['company_name'],
        mobile: json['mobile'],
        country: json['country'],
        time: json['createdDate'],
      );
}
