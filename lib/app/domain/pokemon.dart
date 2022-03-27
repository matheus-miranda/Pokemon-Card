import 'dart:convert';

class Pokemon {
  final String id;
  final String name;
  final String imageUrl;
  final String imageUrlHiRes;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageUrlHiRes,
    required this.types
  });

  String toJson() {
    Map<String, dynamic> json = _fromMapJson();
    return jsonEncode(json);
  }

  Map<String, dynamic> _fromMapJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'imageUrlHiRes': imageUrlHiRes,
      'types': types
    };
  }

  static Pokemon fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return fromMapJson(map);
  }

  static Pokemon fromMapJson(Map<String, dynamic> map) {
    return Pokemon(
        id: map['id'],
        name: map['name'],
        imageUrl: map['imageUrl'],
        imageUrlHiRes: map['imageUrlHiRes'],
        types: map.containsKey('types') ? map['types'].cast<String>() : ['']
    );
  }
}
