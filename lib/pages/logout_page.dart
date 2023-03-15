import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyerup/controllers/auth_controller.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => LogoutPageState();
}

class LogoutPageState extends State<LogoutPage> {
  AuthController? authController;

  @override
  void initState() {
    authController = Get.put(AuthController(), tag: 'auth');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              await authController!.logOut();
            },
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
