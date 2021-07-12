import 'package:amiibo_api/main.dart';
import 'package:amiibo_api/src/models/character_model.dart';
import 'package:amiibo_api/src/provider/character_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:amiibo_api/src/const/colores.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Stack(
          children: [_backgroundPic(), _listCharacters()],
        )));
  }
}

class _backgroundPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _mediaSize = MediaQuery.of(context).size.height * 0.01;
    return Positioned.fill(
      child: Image.asset(
        'img_background.png',
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}

class _logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Container(
      child: Image.asset(
        'img_voiceless_logo.png',
      ),
    );
  }
}

class CharaCol {
  final PersonajesModel character;
  final Color color;

  CharaCol(this.character, this.color);
}

class _listCharacters extends StatefulWidget {
  @override
  __listCharactersState createState() => __listCharactersState();
}

class __listCharactersState extends State<_listCharacters> {
  @override
  void initState() {
    final _characterState = Get.put(characterState());
    _characterState.obtenerPersonajes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 5.0;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<characterState>(
                builder: (characterState characterState) {
              return ListView.builder(
                padding: EdgeInsets.only(left: 0, top: 30),
                itemCount: characterState.characters.length,
                itemBuilder: (context, int i) {
                  final _character = characterState.characters[i];
                  var charaColor = Color.fromRGBO(0, 0, 0, 0);
                  var backgroundAlpha = 0.65;
                  var logo;
                  final a = 0;
                  switch (i) {
                    case 0:
                      charaColor = Color.fromRGBO(255, 208, 0, backgroundAlpha);
                      logo = Image.asset("img_voiceless_logo.png");
                      break;
                    case 1:
                      charaColor = Color.fromRGBO(255, 0, 135, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 2:
                      charaColor = Color.fromRGBO(0, 255, 114, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 3:
                      charaColor = Color.fromRGBO(0, 255, 255, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 4:
                      charaColor = Color.fromRGBO(255, 208, 0, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 5:
                      charaColor = Color.fromRGBO(255, 114, 0, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 6:
                      charaColor = Color.fromRGBO(84, 73, 130, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 7:
                      charaColor = Color.fromRGBO(114, 0, 255, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 8:
                      charaColor = Color.fromRGBO(255, 114, 0, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                    case 9:
                      charaColor = Color.fromRGBO(255, 0, 0, backgroundAlpha);
                      logo = Container(
                          width: double.infinity,
                          height: 40,
                          color: Color.fromRGBO(29, 186, 255, backgroundAlpha));
                      break;
                  }
                  return Column(
                    children: [
                      logo,
                      Stack(children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detalle',
                                arguments: _character);
                          },
                          child: Container(
                              color: charaColor,
                              child: ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: FadeInImage(
                                            width: 45,
                                            height: 45,
                                            placeholder:
                                                AssetImage('spr_loading.gif'),
                                            image: NetworkImage(
                                              _character.image!,
                                            )),
                                      ),
                                    ],
                                  ),
                                  title: Stack(
                                    children: <Widget>[
                                      OutlinedText(
                                        text: Text(_character.character!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: multiplier *
                                                    _unitHeightValue)),
                                        strokes: [
                                          OutlinedTextStroke(
                                              color:
                                                  Color.fromRGBO(57, 14, 47, 1),
                                              width: 0.65 * _unitHeightValue),
                                        ],
                                      )
                                    ],
                                  ))),
                        ),
                      ]),
                    ],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}





//return ListView(
// children: <Widget>[
//    ListTile(
//       leading: CircleAvatar()
//     ),
//   ],
//  );
// }
