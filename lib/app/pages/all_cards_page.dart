import 'package:flutter/material.dart';
import 'package:pokemon/app/domain/pokemon.dart';

class AllCardsPage extends StatefulWidget {

  const AllCardsPage({Key? key}) : super(key: key);

  @override
  State<AllCardsPage> createState() => _AllCardsPageState();
}

class _AllCardsPageState extends State<AllCardsPage> {
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
      appBar: AppBar(title: const Text('Pokemon Cards')),
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(pokemonList.length, (index) {
          var pokemon = pokemonList[index];
          return GestureDetector(
            onTap: () => openDetailScreen(pokemon),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Hero(
                tag: pokemon.id,
                child: Image.network(pokemon.imageUrl),
              ),
            ),
          );
        }),
      ),
    );
  }

  openDetailScreen(Pokemon pokemon) {
    Navigator.of(context).pushNamed('/detail', arguments: {'pokemon': pokemon});
  }
}
