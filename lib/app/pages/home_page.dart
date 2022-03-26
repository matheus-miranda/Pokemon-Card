import 'package:flutter/material.dart';
import 'package:pokemon/app/domain/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokemonList = [
    Pokemon(
        id: 'xy7-10',
        name: 'Vespiquen',
        imageUrl: 'https://images.pokemontcg.io/xy7/10.png',
        imageUrlHiRes: 'https://images.pokemontcg.io/xy7/10_hires.png',
        types: ['Grass']),
    Pokemon(
        id: 'dp6-90',
        name: 'Cubone',
        imageUrl: 'https://images.pokemontcg.io/dp6/90.png',
        imageUrlHiRes: 'https://images.pokemontcg.io/dp6/90_hires.png',
        types: ['Fighting']),
    Pokemon(
        id: 'dp6-90',
        name: 'Cubone',
        imageUrl: 'https://images.pokemontcg.io/dp6/90.png',
        imageUrlHiRes: 'https://images.pokemontcg.io/dp6/90_hires.png',
        types: ['Fighting']),
    Pokemon(
        id: 'xy7-10',
        name: 'Vespiquen',
        imageUrl: 'https://images.pokemontcg.io/xy7/10.png',
        imageUrlHiRes: 'https://images.pokemontcg.io/xy7/10_hires.png',
        types: ['Grass'])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(pokemonList.length, (index) {
          var pokemon = pokemonList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Hero(
              tag: pokemon.id,
              child: Image.network(pokemon.imageUrl),
            ),
          );
        }),
      ),
    );
  }
}
