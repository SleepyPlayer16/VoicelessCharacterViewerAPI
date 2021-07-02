class amiibosModel {
  String? amiiboSeries;
  String? character;
  String? name;
  String? gameSeries;
  String? release;
  String? head;
  String? image;
  String? type;
  String? tail;

  amiibosModel(
      {required this.amiiboSeries,
      required this.character,
      required this.name,
      required this.gameSeries,
      required this.release,
      required this.head,
      required this.image,
      required this.type,
      required this.tail});

  factory amiibosModel.fromJson(Map<String, dynamic> amiibo) => amiibosModel(
      amiiboSeries: amiibo['amiiboSeries'],
      character: amiibo['character'],
      name: amiibo['name'],
      gameSeries: amiibo['gameSeries'],
      release: amiibo['release'],
      head: amiibo['head'],
      image: amiibo['image'],
      type: amiibo['type'],
      tail: amiibo['tail']);
}
