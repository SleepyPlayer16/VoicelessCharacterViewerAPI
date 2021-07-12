import 'package:get/get.dart';
import 'package:amiibo_api/src/models/character_model.dart';
import 'package:amiibo_api/src/provider/character_provider.dart';

class characterState extends GetxController {
  List<PersonajesModel> characters = [];
  final _personajesProvider = voicelessCharacterProvider();

  Future<void> obtenerPersonajes() async {
    final charas = await _personajesProvider.obtenerPersonajes();
    characters.addAll(charas);
    update();
  }
}
