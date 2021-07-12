import 'package:amiibo_api/src/models/character_model.dart';
import 'package:dio/dio.dart';

class voicelessCharacterProvider {
  final String _url =
      'https://voiceless-api.herokuapp.com/api/VoicelessCharacters';
  final http = Dio();

  Future<List<PersonajesModel>> obtenerPersonajes() async {
    final response = await http.get(_url);
    List<PersonajesModel> personajes = [];
    List<dynamic> responsedata = response.data;
    return responsedata
        .map((character) => PersonajesModel.fromMapJson(character))
        .toList();
  }
}
