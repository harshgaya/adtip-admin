import 'package:adtip_admin_panel/modules/refer_withdraw/controllers/refer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/utils/utils.dart';

class ReferalUnpaidPage extends StatefulWidget {
  const ReferalUnpaidPage({super.key});

  @override
  State<ReferalUnpaidPage> createState() => _ReferalUnpaidPageState();
}

class _ReferalUnpaidPageState extends State<ReferalUnpaidPage> {
  final referController = Get.put(ReferController());
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    referController.pageUnpaid = -1;
    referController.referWithdrawUnpaid.value = [];
    referController.getWithdrawalRequestUnpaid();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        referController.getWithdrawalRequestUnpaid();
      }
    });
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
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('User Id')),
                  SizedBox(width: 100, child: Text('Date')),
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
                      itemCount: referController.referWithdrawUnpaid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final withdraw =
                            referController.referWithdrawUnpaid[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Utils.showAlertDialogYesNo(
                                          context: context,
                                          title: 'Are you sure?',
                                          function: () async {
                                            await referController
                                                .changeUnpaidToPaidReferal(
                                                    id: withdraw.id!);

                                            referController
                                                .referWithdrawUnpaid.value = [];
                                            referController.pageUnpaid = -1;
                                            await referController
                                                .getWithdrawalRequestUnpaid();
                                          },
                                          subtitle: 'User will be paid',
                                        );
                                      },
                                      child: const Text('Pay'))),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.id}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.name}')),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                      '${withdraw.withdrawRequestAmount}')),
                              SizedBox(
                                  width: 200, child: Text('${withdraw.upiId}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.mobile}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.userId}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.time}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => referController.unpaidLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
