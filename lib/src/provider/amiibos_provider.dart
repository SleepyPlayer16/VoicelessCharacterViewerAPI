import 'package:amiibo_api/src/models/amiibos_model.dart';
import 'package:dio/dio.dart';

class amiibosProvider {
  final String _url = 'https://www.amiiboapi.com/api/amiibo/';
  final http = Dio();

  Future<List> obtenerAmiibos() async {
    final response = await http.get(_url);
    final responsedata = response.data;
    return responsedata.map((amiibo) => amiibosModel.fromJson(amiibo)).toList();
  }
}
