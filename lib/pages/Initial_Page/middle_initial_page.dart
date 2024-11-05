import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/controllers/Home_controller/home_controller.dart';
import 'package:hinario_para_criancas_ccb/pages/Home/home_page.dart';

class MiddleInitialPage extends StatelessWidget {
  MiddleInitialPage({super.key}) {
    getHomePage();
  }

  void getHomePage() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.lazyPut(() => HomeController());
    Get.offAll(HomePage(
      controller: HomeController(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Image.asset(
          "assets/images/reference.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
