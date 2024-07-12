import 'package:adtip_admin_panel/modules/company/controller/company_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final CompanyController companyController = Get.put(CompanyController());
  final searchController = TextEditingController();

  @override
  void initState() {
    companyController.getAllCompany();
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
              width: 900,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 100, child: Text('Email')),
                  SizedBox(width: 100, child: Text('Website')),
                  SizedBox(width: 100, child: Text('Location')),
                  SizedBox(width: 100, child: Text('Phone')),
                  SizedBox(width: 100, child: Text('Industry')),
                  SizedBox(width: 100, child: Text('About')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => companyController.loading.value
                ? const CircularProgressIndicator()
                : Expanded(
                    child: SizedBox(
                      width: 900,
                      child: ListView.builder(
                        itemCount:
                            companyController.notFollowCompanyData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final company =
                              companyController.notFollowCompanyData[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 100, child: Text('${company.id}')),
                                SizedBox(
                                    width: 100, child: Text('${company.name}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.email}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.website}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.location}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.phone}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.industry}')),
                                SizedBox(
                                    width: 100,
                                    child: Text('${company.about}')),
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
