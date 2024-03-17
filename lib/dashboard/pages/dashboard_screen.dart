import 'package:adtip_admin_panel/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Obx(() => SideNavigationBar(
                theme: SideNavigationBarTheme(
                    backgroundColor: Colors.black,
                    itemTheme: SideNavigationBarItemTheme(
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.grey),
                    togglerTheme: const SideNavigationBarTogglerTheme(),
                    dividerTheme: const SideNavigationBarDividerTheme(
                        showHeaderDivider: true,
                        showMainDivider: true,
                        showFooterDivider: true)),
                selectedIndex: dashboardController.selectedIndex.value,
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.currency_rupee,
                    label: 'Unpaid',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.currency_rupee_sharp,
                    label: 'Paid',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Settings',
                  ),
                ],
                onTap: (index) {
                  dashboardController.changeIndex(index: index);
                },
              )),
          Obx(
            () => SizedBox(
              width: 1239,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: dashboardController.views
                    .elementAt(dashboardController.selectedIndex.value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
