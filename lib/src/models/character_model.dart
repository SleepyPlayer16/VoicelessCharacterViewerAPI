import 'package:flutter/foundation.dart';

class PersonajesModel {
  String? id;
  String? character;
  int? age;
  String? ability;
  String? sprite;
  String? image;
  String? description;

  PersonajesModel(
      {required this.id,
      required this.character,
      required this.age,
      required this.ability,
      required this.sprite,
      required this.image,
      required this.description});

  factory PersonajesModel.fromMapJson(Map<String, dynamic> character) =>
      PersonajesModel(
          id: character['id'],
          character: character['character'],
          age: character['age'],
          ability: character['ability'],
          sprite: character['sprite'],
          image: character['image'],
          description: character['description']);
}
