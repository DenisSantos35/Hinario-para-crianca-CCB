import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/pages/Initial_Page/middle_initial_page.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key}) {
    getMiddleInitial();
  }

  void getMiddleInitial() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAll(MiddleInitialPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.grey,
        child: Image.asset(
          "assets/images/image_initial.png",
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}
