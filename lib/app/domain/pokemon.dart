class Pokemon {
  final String id;
  final String name;
  final String imageUrl;
  final String imageUrlHiRes;
  final List<dynamic> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageUrlHiRes,
    required this.types
  });
}
