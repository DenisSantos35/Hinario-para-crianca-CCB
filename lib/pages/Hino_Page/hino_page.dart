import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/models/Music_Models/music_models.dart';
import 'package:just_audio/just_audio.dart';

import '../../helpers/Colors/colors_app.dart';

class HinoPage extends StatefulWidget {
  MusicModels dataMusic;
  HinoPage({super.key, required this.dataMusic});

  @override
  State<HinoPage> createState() => _HinoPageState();
}

class _HinoPageState extends State<HinoPage> {
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player.setAsset('${widget.dataMusic.asset}');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: ColorsApp.bluePrimary,
        leading: IconButton(
            onPressed: () {
              player.stop();
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
                  "${widget.dataMusic.name}",
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
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorsApp.whitePrimary,
        child: Image.asset(
          widget.dataMusic.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
