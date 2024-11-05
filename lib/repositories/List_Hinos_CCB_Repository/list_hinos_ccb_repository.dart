import 'package:hinario_para_criancas_ccb/models/Music_Models/music_models.dart';

import '../../providers/List_hinos_CCB_Provider/list_hinos_ccp_provider.dart';

class ListHinosCcbRepository {
  ListHinosCcbProvider _client = ListHinosCcbProvider();

  List<MusicModels> getListHinos() => _client.listHinos();
}
