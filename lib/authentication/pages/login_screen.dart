import 'package:adtip_admin_panel/authentication/controllers/login_controller.dart';
import 'package:adtip_admin_panel/helpers/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //height: 500,
          width: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.greyColor, boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              spreadRadius: 1,
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),

              blurRadius: 1,
              offset: const Offset(0, -3), // Top shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(3, 0), // Right shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(-3, 0), // Left shadow
            ),
          ]),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Image.asset('assets/icons/user_placeholder.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: idController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter id';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('ID'),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Password'),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => loginController.isLoading.value
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    loginController.adminLogin(
                                        id: idController.text.trim(),
                                        password:
                                            passwordController.text.trim());
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ],
                      )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
