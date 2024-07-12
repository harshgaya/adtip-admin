import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../helpers/utils/utils.dart';
import '../controller/qr_scan_controller.dart';

class QrScanWebPaid extends StatefulWidget {
  final int companyId;
  const QrScanWebPaid({super.key, required this.companyId});

  @override
  State<QrScanWebPaid> createState() => _QrScanWebPaidState();
}

class _QrScanWebPaidState extends State<QrScanWebPaid> {
  final searchController = TextEditingController();
  final qrScanController = Get.put(QrScanController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrScanController.getQrPaidData(companyId: widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        qrScanController.getQrPaidData(companyId: widget.companyId);
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
                        itemCount: qrScanController.qrScanPaid.length,
                        itemBuilder: (BuildContext context, int index) {
                          final qrScanUnpaid =
                              qrScanController.qrScanPaid[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
              Obx(() => qrScanController.loadingPaid.value
                  ? const CircularProgressIndicator()
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
