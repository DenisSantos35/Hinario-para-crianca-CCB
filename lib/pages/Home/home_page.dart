import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/controllers/Home_controller/home_controller.dart';
import 'package:hinario_para_criancas_ccb/controllers/Question_controller/question_controller.dart';
import 'package:hinario_para_criancas_ccb/helpers/Colors/colors_app.dart';
import 'package:hinario_para_criancas_ccb/pages/Search_Hinos/search_hinos_page.dart';
import 'package:just_audio/just_audio.dart';

import '../../components/Icon_button/icon_buttom.dart';
import '../Question_Page/question_page.dart';

class HomePage extends StatelessWidget {
  HomeController controller;
  HomePage({super.key, required this.controller});
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: ColorsApp.bluePrimary,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    () => IconButtom.bottomIcon(
                        size: controller.isHome ? 40 : 28,
                        colors: controller.isHome
                            ? Color(0xfff02c07)
                            : ColorsApp.blackPrimary,
                        icon: Icons.home,
                        function: () {
                          player.pause();
                          controller.isHome = true;
                          controller.isMusic = false;
                          controller.isQuestion = false;
                        }),
                  ), //person
                  Obx(
                    () => IconButtom.bottomIcon(
                        size: controller.isMusic ? 40 : 28,
                        colors: controller.isMusic
                            ? Color(0xfff02c07)
                            : ColorsApp.blackPrimary,
                        icon: Icons.my_library_music_outlined,
                        function: () {
                          controller.isHome = false;
                          controller.isMusic = true;
                          controller.isQuestion = false;
                        }),
                  ),
                  Obx(
                    () => IconButtom.bottomIcon(
                        size: controller.isQuestion ? 40 : 28,
                        colors: controller.isQuestion
                            ? Color(0xfff02c07)
                            : ColorsApp.blackPrimary,
                        icon: Icons.question_answer_outlined,
                        function: () {
                          player.pause();
                          controller.isHome = false;
                          controller.isMusic = false;
                          controller.isQuestion = true;
                        }),
                  ),
                ],
              ),
            ), // Adjust height as needed
          ),
        ),
        body: Obx(
          () => controller.isHome
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  color: ColorsApp.whitePrimary,
                  child: Image.asset(
                    "assets/images/oracao_pai_nosso.png",
                    fit: BoxFit.fill,
                  ),
                )
              : controller.isMusic
                  ? SearchHinosPage(
                      controller: controller,
                    )
                  : QuestionPage(
                      controller: QuestionController(),
                    ),
        ));
  }
}
