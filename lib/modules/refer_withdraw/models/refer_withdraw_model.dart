import 'dart:convert';

class ReferWithdrawModel {
  int? status;
  String? message;
  List<ReferWithdraw>? data;

  ReferWithdrawModel({
    this.status,
    this.message,
    this.data,
  });

  factory ReferWithdrawModel.fromJson(Map<String, dynamic> json) =>
      ReferWithdrawModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ReferWithdraw>.from(
                json["data"]!.map((x) => ReferWithdraw.fromJson(x))),
      );
}

class ReferWithdraw {
  int? id;
  String? name;
  String? mobile;
  String? time;
  String? upiId;
  int? userId;
  String? paidDate;
  dynamic withdrawRequestAmount;
  String? transactionStatus;

  ReferWithdraw(
      {required this.withdrawRequestAmount,
      required this.transactionStatus,
      required this.userId,
      required this.id,
      required this.name,
      required this.time,
      required this.mobile,
      required this.paidDate,
      required this.upiId});

  factory ReferWithdraw.fromJson(Map<String, dynamic> json) => ReferWithdraw(
        withdrawRequestAmount: json["withdraw_amount"],
        transactionStatus: json["status"],
        userId: json["user_id"],
        id: json["id"],
        name: json["name"],
        time: json["time"],
        mobile: json["mobile"],
        upiId: json["upi_id"],
        paidDate: json["paid_time"],
      );
}
