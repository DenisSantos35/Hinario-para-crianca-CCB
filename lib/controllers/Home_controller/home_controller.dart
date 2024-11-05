import 'package:get/get.dart';
import 'package:hinario_para_criancas_ccb/models/Music_Models/music_models.dart';
import 'package:hinario_para_criancas_ccb/repositories/List_Hinos_CCB_Repository/list_hinos_ccb_repository.dart';

class HomeController extends GetxController {
  ListHinosCcbRepository _client = ListHinosCcbRepository();
  final _isHome = true.obs;
  bool get isHome => _isHome.value;
  set isHome(bool value) => _isHome.call(value);

  final _isQuestion = false.obs;
  bool get isQuestion => _isQuestion.value;
  set isQuestion(bool value) => _isQuestion.call(value);

  final _isMusic = false.obs;
  bool get isMusic => _isMusic.value;
  set isMusic(bool value) => _isMusic.call(value);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isHome = true;
    isMusic = false;
    isQuestion = false;
    print("home");
  }

  List<MusicModels> getListHinos() {
    return _client.getListHinos();
  }
}
