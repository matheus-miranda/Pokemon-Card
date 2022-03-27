import 'package:flutter/material.dart';
import 'package:pokemon/app/app_config.dart';
import 'package:pokemon/app/domain/pokemon.dart';
import 'package:pokemon/app/repository/pokemon_repo_interface.dart';

class ObtainedCardsPage extends StatefulWidget {
  const ObtainedCardsPage({Key? key}) : super(key: key);

  @override
  State<ObtainedCardsPage> createState() => _ObtainedCardsPageState();
}

class _ObtainedCardsPageState extends State<ObtainedCardsPage> {
  List<Pokemon> pokemonList = [];
  late PokemonRepoInterface repository;

  @override
  Widget build(BuildContext context) {
    repository = AppConfig.of(context)!.pokemonRepo;
    loadPokemon();

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

  void loadPokemon() async {
    var obtainedPokemon = await repository.getObtainedPokemon();
    setState(() {
      pokemonList = obtainedPokemon;
    });
  }

  openDetailScreen(Pokemon pokemon) {
    Navigator.of(context).pushNamed('/detail', arguments: {'pokemon': pokemon});
  }
}
