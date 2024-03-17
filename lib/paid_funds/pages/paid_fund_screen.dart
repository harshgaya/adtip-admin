import 'package:adtip_admin_panel/paid_funds/controllers/paid_funds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PaidFundScreen extends StatefulWidget {
  const PaidFundScreen({super.key});

  @override
  State<PaidFundScreen> createState() => _PaidFundScreenState();
}

class _PaidFundScreenState extends State<PaidFundScreen> {
  PaidFundController paidFundController = Get.put(PaidFundController());
  final searchController = TextEditingController();
  @override
  void initState() {
    paidFundController.getPaidFunds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 100, child: Text('Request Id')),
                  SizedBox(width: 100, child: Text('User Id')),
                  SizedBox(width: 100, child: Text('Total Balance')),
                  // SizedBox(width: 100, child: Text('Name')),
                  // SizedBox(width: 100, child: Text('Email')),
                  // SizedBox(width: 100, child: Text('DOB')),
                  // SizedBox(width: 100, child: Text('Profession')),
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 100, child: Text('Date')),
                  SizedBox(width: 150, child: Text('Transaction Method')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('Bank Name')),
                  SizedBox(width: 200, child: Text('Account Number')),
                  SizedBox(width: 100, child: Text('IFSC Code')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => paidFundController.isLoading.value
                ? const CircularProgressIndicator()
                : Expanded(
                    child: SizedBox(
                      width: 2000,
                      child: ListView.builder(
                        itemCount: paidFundController.paidFundsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final paidFund =
                              paidFundController.paidFundsList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 100, child: Text('${paidFund.id}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${paidFund.createdBy}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${paidFund.totalBalance}')),
                                // SizedBox(
                                //     width: 100, child: Text('${paidFund.name}')),
                                // SizedBox(
                                //     width: 100,
                                //     child: Text('${paidFund.emailId}')),
                                // SizedBox(
                                //     width: 100, child: Text('${paidFund.dob}')),
                                // SizedBox(
                                //     width: 100,
                                //     child: Text('${paidFund.profession}')),
                                SizedBox(
                                    width: 200,
                                    child: Text(
                                        '${paidFund.withdrawRequestAmount}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${paidFund.date}')),
                                SizedBox(
                                    width: 150,
                                    child:
                                        Text('${paidFund.transactionMethod}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${paidFund.upiId}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${paidFund.mobileNumber}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${paidFund.bankName}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${paidFund.accountNumber}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${paidFund.ifsc}')),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
