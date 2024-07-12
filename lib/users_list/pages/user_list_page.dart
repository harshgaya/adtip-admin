import 'package:adtip_admin_panel/users_list/controllers/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/local_database/local_prefs.dart';
import '../../helpers/local_database/sharedpref_key.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final UserListController userListController = Get.put(UserListController());
  final searchController = TextEditingController();

  @override
  void initState() {
    userListController.getUsers();
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        userListController.getUsers();
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
              width: 500,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 100, child: Text('Email')),
                  SizedBox(width: 100, child: Text('Mobile')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: SizedBox(
                    width: 500,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: userListController.userList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final user = userListController.userList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 100, child: Text('${user.id}')),
                              SizedBox(width: 100, child: Text('${user.name}')),
                              SizedBox(
                                  width: 100, child: Text('${user.emailId}')),
                              SizedBox(
                                  width: 100, child: Text('${user.mobile}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => userListController.pageLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
