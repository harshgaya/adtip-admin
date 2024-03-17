class PaidFundModel {
  int? status;
  String? message;
  List<PaidFund> data;

  PaidFundModel(
      {required this.status, required this.data, required this.message});
  factory PaidFundModel.fromJson(Map<String, dynamic> json) => PaidFundModel(
      status: json["status"],
      message: json['message'],
      data: json["data"] == []
          ? []
          : List<PaidFund>.from(
              json["data"].map((x) => PaidFund.fromJson(x)),
            ));
}

class PaidFund {
  int? id;
  // String? name;
  // String? emailId;
  // String? dob;
  // String? profession;
  int? withdrawRequestAmount;
  String? transactionMethod;
  String? upiId;
  String? mobileNumber;
  String? bankName;
  String? accountNumber;
  String? ifsc;
  int? createdBy;
  int? transactionStatus;
  String? transactionType;
  double? totalBalance;
  String? date;

  PaidFund({
    required this.id,
    // required this.name,
    required this.transactionType,
    required this.transactionStatus,
    required this.accountNumber,
    required this.bankName,
    required this.createdBy,
    //required this.dob,
    //  required this.emailId,
    required this.ifsc,
    required this.mobileNumber,
    // required this.profession,
    required this.transactionMethod,
    required this.upiId,
    required this.withdrawRequestAmount,
    required this.totalBalance,
    required this.date,
  });

  factory PaidFund.fromJson(Map<String, dynamic> json) => PaidFund(
      id: json['id'],
      //  name: json['name'],
      transactionType: json['transaction_type'],
      transactionStatus: json['transaction_status'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
      createdBy: json['createdby'],
      // dob: json['dob'],
      // emailId: json['emailId'],
      ifsc: json['IFSC'],
      mobileNumber: json['mobileNumber'],
      // profession: json['profession'],
      transactionMethod: json['transaction_method'],
      upiId: json['upi_id'],
      withdrawRequestAmount: json['withdraw_req_amount'],
      totalBalance: json['totalBalance'],
      date: json['transaction_date']);
// "id": 2058,
//             "totalBalance": 0.9,
//             "transaction_status": 5,
//             "amount": 0.9,
//             "withdraw_req_amount": 0,
//             "withdraw_request_id": null,
//             "complaint": null,
//             "paid_status": "Paid",
//             "transaction_date": "2024-03-16T06:03:35.000Z",
//             "bankName": null,
//             "accountNumber": null,
//             "IFSC": null,
//             "mobileNumber": null,
//             "upi_id": null,
//             "transaction_method": null,
//             "transaction_type": "Deposite",
//             "card_number": null,
//             "card_expiry": null,
//             "cvv": null,
//             "transaction_otp": null,
//             "createdby": 635,
//             "createddate": "2024-03-16T06:03:35.000Z",
//             "updateddate": null
}
