import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/Colors/colors_app.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorsApp.bluePrimary,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsApp.blackPrimary,
              size: 30,
            )),
        title: Text(
          "Hinário \n das Crianças",
          style: TextStyle(
              color: ColorsApp.blackPrimary,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.w600,
              fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
        child: BottomAppBar(
          color: ColorsApp.bluePrimary,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HISTÓRIA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorsApp.blackPrimary,
                      fontFamily: "Times New Roman",
                      fontSize: 22),
                )
              ],
            ),
          ), // Adjust height as needed
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child: Image.asset(
                "assets/images/historia_page1.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              child: Image.asset(
                "assets/images/historia_page3.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
