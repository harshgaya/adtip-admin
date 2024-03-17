import 'package:adtip_admin_panel/helpers/constants/app_colors.dart';
import 'package:adtip_admin_panel/helpers/utils/utils.dart';
import 'package:adtip_admin_panel/withdrawal_requests/withdrawal_requests_controller/withdrawal_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/local_database/local_prefs.dart';
import '../../helpers/local_database/sharedpref_key.dart';

class WithDrawalRequest extends StatefulWidget {
  const WithDrawalRequest({super.key});

  @override
  State<WithDrawalRequest> createState() => _WithDrawalRequestState();
}

class _WithDrawalRequestState extends State<WithDrawalRequest> {
  WithdrawalRequestController withdrawalRequestController =
      Get.put(WithdrawalRequestController());
  final searchController = TextEditingController();

  @override
  void initState() {
    withdrawalRequestController.getWithdrawalRequest();
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        withdrawalRequestController.getWithdrawalRequest();
        print("sumit");
      }
    });
    print(
        'user token ${LocalPrefs().getStringPref(key: SharedPreferenceKey.UserLoggedIn)}');
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              //  height: 60,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 2000,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 200, child: Text('Action')),
                  SizedBox(width: 100, child: Text('Request Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 100, child: Text('Email')),
                  SizedBox(width: 100, child: Text('DOB')),
                  SizedBox(width: 100, child: Text('Profession')),
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 150, child: Text('Transaction Method')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('Bank Name')),
                  SizedBox(width: 200, child: Text('Account Number')),
                  SizedBox(width: 100, child: Text('IFSC Code')),
                  SizedBox(width: 100, child: Text('User Id')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: SizedBox(
                    width: 2000,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: withdrawalRequestController
                          .withdrawRequestList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final withdraw = withdrawalRequestController
                            .withdrawRequestList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await withdrawalRequestController
                                                .checkBalance(
                                                    context: context,
                                                    userId:
                                                        withdraw.createdBy!);
                                          },
                                          child: const Text('Balance')),
                                      ElevatedButton(
                                          onPressed: () {
                                            Utils.showAlertDialogYesNo(
                                              context: context,
                                              title: 'Are you sure?',
                                              function: () async {
                                                double? balance =
                                                    await withdrawalRequestController
                                                        .returnBalance(
                                                            userId: withdraw
                                                                .createdBy!);
                                                if (balance == null) {
                                                  return Utils.showErrorMessage(
                                                      'Something went wrong');
                                                } else {
                                                  await withdrawalRequestController
                                                      .updatePaidToUnpaid(
                                                    userId: withdraw.createdBy!,
                                                    context: context,
                                                    totalBalance: balance,
                                                    withdrawReqAmount: withdraw
                                                        .withdrawRequestAmount,
                                                    transactionType: withdraw
                                                        .transactionType!,
                                                    transactionMethod: withdraw
                                                        .transactionMethod!,
                                                    bankName: withdraw.bankName,
                                                    accountNumber:
                                                        withdraw.accountNumber,
                                                    ifsc: withdraw.ifsc,
                                                    mobileNumber:
                                                        withdraw.mobileNumber,
                                                    upiId: withdraw.upiId,
                                                    requestId:
                                                        withdraw.requestId!,
                                                    id: withdraw.requestId!,
                                                  );
                                                }
                                                withdrawalRequestController
                                                    .withdrawRequestList
                                                    .value = [];
                                                withdrawalRequestController
                                                    .page = -1;
                                                await withdrawalRequestController
                                                    .getWithdrawalRequest();
                                              },
                                              subtitle: 'User will be paid',
                                            );
                                          },
                                          child: const Text('Pay'))
                                    ],
                                  )),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.requestId}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.name}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.emailId}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.dob}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.profession}')),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                      '${withdraw.withdrawRequestAmount}')),
                              SizedBox(
                                  width: 150,
                                  child: Text('${withdraw.transactionMethod}')),
                              SizedBox(
                                  width: 200, child: Text('${withdraw.upiId}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.mobileNumber}')),
                              SizedBox(
                                  width: 200,
                                  child: Text('${withdraw.bankName}')),
                              SizedBox(
                                  width: 200,
                                  child: Text('${withdraw.accountNumber}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.ifsc}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.createdBy}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => withdrawalRequestController.pageLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}

// class WithDrawalRequest extends StatefulWidget {
//   const WithDrawalRequest({super.key});
//
//   @override
//   State<WithDrawalRequest> createState() => _WithDrawalRequestState();
// }
//
// class _WithDrawalRequestState extends State<WithDrawalRequest> {
//   WithdrawalRequestController withdrawalRequestController =
//       Get.put(WithdrawalRequestController());
//   final searchController = TextEditingController();
//
//   @override
//   void initState() {
//     withdrawalRequestController.getWithdrawalRequest();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 300,
//               child: TextFormField(
//                 controller: searchController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Search',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Obx(() => SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     // Use DataTable or any other widget for tabular data
//                     columns: const [
//                       DataColumn(label: Text('Request Id')),
//                       DataColumn(label: Text('Name')),
//                       DataColumn(label: Text('Email')),
//                       DataColumn(label: Text('DOB')),
//                       DataColumn(label: Text('Profession')),
//                       DataColumn(label: Text('Withdraw Req Amount')),
//                       DataColumn(label: Text('Transaction Method')),
//                       DataColumn(label: Text('UPI ID')),
//                       DataColumn(label: Text('Mobile Number')),
//                       DataColumn(label: Text('Bank Name')),
//                       DataColumn(label: Text('Account Number')),
//                       DataColumn(label: Text('IFSC Code')),
//                       DataColumn(label: Text('User Id')),
//                     ],
//                     rows: withdrawalRequestController.withdrawRequestList
//                         .map<DataRow>((withdraw) => DataRow(
//                               cells: [
//                                 DataCell(Text('${withdraw.requestId}')),
//                                 DataCell(Text('${withdraw.name}')),
//                                 DataCell(Text('${withdraw.emailId}')),
//                                 DataCell(Text('${withdraw.dob}')),
//                                 DataCell(Text('${withdraw.profession}')),
//                                 DataCell(
//                                     Text('${withdraw.withdrawRequestAmount}')),
//                                 DataCell(Text('${withdraw.transactionMethod}')),
//                                 DataCell(Text('${withdraw.upiId}')),
//                                 DataCell(Text('${withdraw.mobileNumber}')),
//                                 DataCell(Text('${withdraw.bankName}')),
//                                 DataCell(Text('${withdraw.accountNumber}')),
//                                 DataCell(Text('${withdraw.ifsc}')),
//                                 DataCell(Text('${withdraw.createdBy}')),
//                               ],
//                             ))
//                         .toList(),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
