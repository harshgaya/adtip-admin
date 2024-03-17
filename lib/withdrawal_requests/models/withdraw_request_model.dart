class WithDrawRequestModel {
  int? count;
  List<WithdrawRequest> data;

  WithDrawRequestModel({required this.count, required this.data});
  factory WithDrawRequestModel.fromJson(Map<String, dynamic> json) =>
      WithDrawRequestModel(
        count: json["status"],
        data: json["usersWithdrawRequest"] == []
            ? []
            : List<WithdrawRequest>.from(
                json["usersWithdrawRequest"]
                    .map((x) => WithdrawRequest.fromJson(x)),
              ),
        // data: (json["usersWithdrawRequest"] as List<dynamic>?)
        //         ?.map((x) => WithdrawRequest.fromJson(x))
        //         .toList() ??
        //     [],
      );
}

class WithdrawRequest {
  int? requestId;
  String? name;
  String? emailId;
  String? dob;
  String? profession;
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

  WithdrawRequest({
    required this.requestId,
    required this.name,
    required this.transactionType,
    required this.transactionStatus,
    required this.accountNumber,
    required this.bankName,
    required this.createdBy,
    required this.dob,
    required this.emailId,
    required this.ifsc,
    required this.mobileNumber,
    required this.profession,
    required this.transactionMethod,
    required this.upiId,
    required this.withdrawRequestAmount,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) =>
      WithdrawRequest(
        requestId: json['request_id'],
        name: json['name'],
        transactionType: json['transaction_type'],
        transactionStatus: json['transaction_status'],
        accountNumber: json['accountNumber'],
        bankName: json['bankName'],
        createdBy: json['createdby'],
        dob: json['dob'],
        emailId: json['emailId'],
        ifsc: json['IFSC'],
        mobileNumber: json['mobileNumber'],
        profession: json['profession'],
        transactionMethod: json['transaction_method'],
        upiId: json['upi_id'],
        withdrawRequestAmount: json['withdraw_req_amount'],
      );
}

// "request_id": 1169,
//             "name": "ramg",
//             "emailId": null,
//             "dob": "18",
//             "profession": "Lawyer",
//             "withdraw_req_amount": 8,
//             "transaction_method": "UPI",
//             "upi_id": "7817996741@ibl",
//             "mobileNumber": "7817996741",
//             "bankName": null,
//             "accountNumber": null,
//             "IFSC": null,
//             "createdby": 397,
//             "transaction_status": 6,
//             "transaction_type": "Withdrawal"
