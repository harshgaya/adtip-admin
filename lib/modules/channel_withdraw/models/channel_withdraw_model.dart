import 'dart:convert';

class ChannelWithdrawModel {
  int? status;
  String? message;
  List<ChannelWithdraw>? data;

  ChannelWithdrawModel({
    this.status,
    this.message,
    this.data,
  });

  factory ChannelWithdrawModel.fromJson(Map<String, dynamic> json) =>
      ChannelWithdrawModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ChannelWithdraw>.from(
                json["data"]!.map((x) => ChannelWithdraw.fromJson(x))),
      );
}

class ChannelWithdraw {
  int? id;
  String? name;
  String? mobile;
  String? time;
  String? upiId;
  int? userId;
  String? paidDate;
  dynamic withdrawRequestAmount;
  String? transactionStatus;
  int? totalAdsDisplay;
  int? totalAdsView;
  int? totalAdsLike;
  dynamic totalEarnings;
  ChannelWithdraw({
    required this.withdrawRequestAmount,
    required this.transactionStatus,
    required this.userId,
    required this.id,
    required this.name,
    required this.time,
    required this.mobile,
    required this.totalEarnings,
    required this.paidDate,
    required this.upiId,
    required this.totalAdsLike,
    required this.totalAdsView,
    required this.totalAdsDisplay,
  });

  factory ChannelWithdraw.fromJson(Map<String, dynamic> json) =>
      ChannelWithdraw(
        withdrawRequestAmount: json["withdraw_request_amount"],
        transactionStatus: json["status"],
        userId: json["created_by"],
        id: json["id"],
        name: json["channel_name"],
        time: json["created_time"],
        mobile: json["user_phone"],
        upiId: json["upi_id"],
        paidDate: json["updated_time"],
        totalEarnings: json["total_earnings"],
        totalAdsLike: json["total_ads_like"],
        totalAdsView: json["total_ads_view"],
        totalAdsDisplay: json["total_ads_display"],
      );
}
