import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/refer_controller.dart';

class ReferalPaidPage extends StatefulWidget {
  const ReferalPaidPage({super.key});

  @override
  State<ReferalPaidPage> createState() => _ReferalPaidPageState();
}

class _ReferalPaidPageState extends State<ReferalPaidPage> {
  final referController = Get.put(ReferController());
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    referController.pagePaid = -1;
    referController.referWithdrawPaid.value = [];
    referController.getWithdrawalRequestPaid();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        referController.getWithdrawalRequestPaid();
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
                  SizedBox(width: 100, child: Text('Request Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('User Id')),
                  SizedBox(width: 100, child: Text('Withdraw Time')),
                  SizedBox(width: 100, child: Text('Paid Time')),
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
                      itemCount: referController.referWithdrawPaid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final withdraw =
                            referController.referWithdrawPaid[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                  width: 100,
                                  child: Text('${withdraw.paidDate}')),
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
