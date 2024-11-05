import 'package:hinario_para_criancas_ccb/models/Music_Models/music_models.dart';

class ListHinosCcbProvider {
  List<MusicModels> listHinos() {
    try {
      List<MusicModels> hinos = [];

      for (int i = 431; i <= 480; i++) {
        hinos.add(MusicModels(
            number: i,
            name: "Hino ${i}",
            asset: "assets/music/hino_${i}.m4a",
            image: "assets/images/hino_${i}.png"));
      }

      return hinos;
    } catch (e) {
      return [];
    }
  }
}
