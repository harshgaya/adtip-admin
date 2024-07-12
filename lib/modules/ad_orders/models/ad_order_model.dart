import 'package:flutter/cupertino.dart';

class AdOrder {
  int? status;
  String? message;
  List<AdOrderModel> data = [];
  AdOrder({required this.message, required this.data, required this.status});

  factory AdOrder.fromJson(Map<String, dynamic> json) => AdOrder(
        message: json['message'],
        data: List<AdOrderModel>.from(
            json['data'].map((x) => AdOrderModel.fromJson(x))),
        status: json['status'],
      );
}

class AdOrderModel {
  dynamic id;
  dynamic companyName;
  dynamic targetArea;
  dynamic totalTargetPerDay;
  dynamic perDayPay;
  dynamic totalViews;
  dynamic totalLikes;
  dynamic startDate;
  dynamic endDate;
  dynamic video;
  dynamic isThirdPageSave;
  dynamic website;
  dynamic adValue;
  dynamic adTotalValue;
  dynamic isActive;
  dynamic pendingBalance;

  AdOrderModel({
    required this.id,
    required this.companyName,
    required this.website,
    required this.totalLikes,
    required this.totalViews,
    required this.adValue,
    required this.isActive,
    required this.video,
    required this.adTotalValue,
    required this.endDate,
    required this.isThirdPageSave,
    required this.perDayPay,
    required this.startDate,
    required this.targetArea,
    required this.totalTargetPerDay,
    required this.pendingBalance,
  });
  factory AdOrderModel.fromJson(Map<String, dynamic> json) => AdOrderModel(
        id: json['id'],
        companyName: json['company_name'],
        website: json['ad_website'],
        totalLikes: json['ad_like'],
        totalViews: json['ad_view'],
        adValue: json['ad_order_value'],
        adTotalValue: json['ad_total'],
        isActive: json['is_active'],
        video: json['ad_upload_filename'],
        endDate: json['ad_end_date'],
        startDate: json['ad_start_date'],
        perDayPay: json['ad_perday_pay'],
        targetArea: json['target_area'],
        totalTargetPerDay: json['ad_customer_target_per_day'],
        isThirdPageSave: json['is_third_page_save'],
        pendingBalance: json['pending_ad_balance'],
      );
}
