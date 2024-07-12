import 'package:adtip_admin_panel/authentication/pages/login_screen.dart';
import 'package:adtip_admin_panel/dashboard/pages/dashboard_screen.dart';
import 'package:adtip_admin_panel/helpers/local_database/sharedpref_key.dart';
import 'package:adtip_admin_panel/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helpers/local_database/local_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    boardingShow();
    super.initState();
  }

  void boardingShow() async {
    token = LocalPrefs().getStringPref(
      key: SharedPreferenceKey.UserLoggedIn,
    );
    print('token $token');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Adtip Admin Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: token == null ? const LoginScreen() : const DashBoardScreen(),
      // initialRoute: token == null ? Routes.LOGIN : Routes.DASHBOARD,
      // getPages: AppPages.routes,
    );
  }
}
