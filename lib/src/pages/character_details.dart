import 'package:amiibo_api/main.dart';
import 'package:amiibo_api/src/models/character_model.dart';
import 'package:amiibo_api/src/provider/character_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlined_text/outlined_text.dart';

var color = Color.fromRGBO(0, 0, 0, 0);
var backgroundAlpha = 1.0;

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Stack(
          children: [BackgroundColor(), CharacterDetails()],
        )));
  }
}

class BackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
    );
  }
}

class _backgroundPic extends StatefulWidget {
  @override
  __backgroundPicState createState() => __backgroundPicState();
}

class __backgroundPicState extends State<_backgroundPic> {
  int selectedBlendModeIndex = 0;
  Map<String, BlendMode> blendModeMap = Map();
  @override
  void initState() {
    super.initState();
    blendModeMap.putIfAbsent("Screen", () => BlendMode.screen);
  }

  Widget build(BuildContext context) {
    final double _mediaSize = MediaQuery.of(context).size.height * 0.01;
    return Positioned.fill(
      child: Image.asset('img_backgroundBlend.png',
          repeat: ImageRepeat.repeat,
          color: color,
          colorBlendMode:
              blendModeMap.putIfAbsent("Screen", () => BlendMode.screen)),
    );
  }
}

class CharacterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PersonajesModel character =
        ModalRoute.of(context)!.settings.arguments as PersonajesModel;

    double _unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    var age = character.age.toString();
    switch (character.character) {
      case 'Karu':
        color = Color.fromRGBO(255, 208, 0, backgroundAlpha);
        break;
      case 'Liz':
        color = Color.fromRGBO(255, 0, 135, backgroundAlpha);
        break;
      case 'Froo':
        color = Color.fromRGBO(0, 255, 114, backgroundAlpha);
        break;
      case 'Dawn':
        color = Color.fromRGBO(0, 255, 255, backgroundAlpha);
        break;
      case 'Unknown':
        color = Color.fromRGBO(255, 208, 0, backgroundAlpha);
        break;
      case 'Ava':
        color = Color.fromRGBO(255, 114, 0, backgroundAlpha);
        break;
      case 'Clarice':
        color = Color.fromRGBO(84, 73, 130, backgroundAlpha);
        break;
      case 'Chizuru':
        color = Color.fromRGBO(114, 0, 255, backgroundAlpha);
        break;
      case 'Hazuki':
        color = Color.fromRGBO(255, 114, 0, backgroundAlpha);
        break;
      case 'Applesauce':
        color = Color.fromRGBO(255, 0, 0, backgroundAlpha);
        break;
    }
    return Stack(
      children: [
        _backgroundPic(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                elevation: 0.0,
                backgroundColor: color,
                title: Container(
                    margin: EdgeInsets.only(right: 7.0 * _unitHeightValue),
                    child: Center(
                        child: OutlinedText(
                            strokes: [
                          OutlinedTextStroke(
                              color: Color.fromRGBO(57, 14, 47, 1),
                              width: 0.45 * _unitHeightValue),
                        ],
                            text: Text(character.character!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 3.5 * _unitHeightValue,
                                  fontWeight: FontWeight.bold,
                                )))))),
            body: Center(
                child: Stack(
              children: [
                Center(
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 300.0),
                    child: Image.network(
                      character.sprite!,
                      isAntiAlias: false,
                      scale: 0.5,
                    ),
                  ),
                ),
                Container(
                    child: Stack(
                      children: [
                        ListView(
                          children: <Widget>[
                            Container(
                              color: color,
                              child: ListTile(
                                  title: Center(
                                      child: Stack(children: <Widget>[
                                OutlinedText(
                                  text: Text("Nombre: " + character.character!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 3.5 * _unitHeightValue,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  strokes: [
                                    OutlinedTextStroke(
                                        color: Color.fromRGBO(57, 14, 47, 1),
                                        width: 0.45 * _unitHeightValue),
                                  ],
                                ),
                              ]))),
                            ),
                            ListTile(
                                title: Center(
                                    child: Stack(children: <Widget>[
                              OutlinedText(
                                text: Text(
                                  "Edad: " + age,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3.5 * _unitHeightValue,
                                      fontWeight: FontWeight.bold),
                                ),
                                strokes: [
                                  OutlinedTextStroke(
                                      color: Color.fromRGBO(57, 14, 47, 1),
                                      width: 0.45 * _unitHeightValue),
                                ],
                              ),
                            ]))),
                            Container(
                              color: color,
                              child: ListTile(
                                  title: Center(
                                      child: Stack(children: <Widget>[
                                OutlinedText(
                                  text: Text("Habilidad: " + character.ability!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 3.5 * _unitHeightValue,
                                          fontWeight: FontWeight.bold)),
                                  strokes: [
                                    OutlinedTextStroke(
                                        color: Color.fromRGBO(57, 14, 47, 1),
                                        width: 0.45 * _unitHeightValue),
                                  ],
                                ),
                              ]))),
                            ),
                            ListTile(
                                title: Center(
                                    child: Stack(children: <Widget>[
                              OutlinedText(
                                text: Text(
                                    "Descripción: " + character.description!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 3.5 * _unitHeightValue,
                                        fontWeight: FontWeight.bold)),
                                strokes: [
                                  OutlinedTextStroke(
                                      color: Color.fromRGBO(57, 14, 47, 1),
                                      width: 0.45 * _unitHeightValue),
                                ],
                              ),
                            ]))),
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(top: 45.0 * _unitHeightValue),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                color: Color.fromRGBO(57, 14, 47, 1),
                                width: 1 * _unitHeightValue))))
              ],
            ))),
      ],
    );
  }
}
