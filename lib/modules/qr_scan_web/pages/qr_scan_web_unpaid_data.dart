import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helpers/utils/utils.dart';
import '../controller/qr_scan_controller.dart';

class QrScanWebUnpaidData extends StatefulWidget {
  final int? companyId;
  const QrScanWebUnpaidData({super.key, this.companyId});

  @override
  State<QrScanWebUnpaidData> createState() => _QrScanWebUnpaidDataState();
}

class _QrScanWebUnpaidDataState extends State<QrScanWebUnpaidData> {
  final searchController = TextEditingController();
  final qrScanController = Get.put(QrScanController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrScanController.getQrUnpaidData(companyId: widget.companyId!);
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        qrScanController.getQrUnpaidData(companyId: widget.companyId!);
      }
    });

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
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
                    SizedBox(width: 100, child: Text('Company Name')),
                    SizedBox(width: 100, child: Text('Company Id')),
                    SizedBox(width: 100, child: Text('Ad Name')),
                    SizedBox(width: 100, child: Text('Ad Id')),
                    SizedBox(width: 200, child: Text('Date')),
                    SizedBox(width: 150, child: Text('Name')),
                    SizedBox(width: 200, child: Text('User ID')),
                    SizedBox(width: 200, child: Text('Mobile Number')),
                    SizedBox(width: 100, child: Text('Upi Id')),
                    SizedBox(width: 200, child: Text('Profession')),
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
                        itemCount: qrScanController.qrScanUnpaid.length,
                        itemBuilder: (BuildContext context, int index) {
                          final qrScanUnpaid =
                              qrScanController.qrScanUnpaid[index];
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
                                            onPressed: () {
                                              Utils.showAlertDialogYesNo(
                                                context: context,
                                                title: 'Are you sure?',
                                                function: () async {
                                                  await qrScanController
                                                      .setUnpaidToPaid(
                                                          id: qrScanUnpaid.id!);
                                                  qrScanController
                                                      .qrScanUnpaid.value = [];
                                                  qrScanController.page = -1;
                                                  await qrScanController
                                                      .getQrUnpaidData(
                                                          companyId: widget
                                                              .companyId!);
                                                },
                                                subtitle: 'User will be paid',
                                              );
                                            },
                                            child: const Text('Pay'))
                                      ],
                                    )),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.id}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.companyName}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.companyId}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.adName}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.adId}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${qrScanUnpaid.date}')),
                                SizedBox(
                                    width: 150,
                                    child: Text('${qrScanUnpaid.userName}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${qrScanUnpaid.userId}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${qrScanUnpaid.mobile}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${qrScanUnpaid.upiId}')),
                                SizedBox(
                                    width: 200,
                                    child: Text('${qrScanUnpaid.profession}')),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )),
              Obx(() => qrScanController.loadingUnpaid.value
                  ? const CircularProgressIndicator()
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
