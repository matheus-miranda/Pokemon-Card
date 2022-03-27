import 'package:flutter/material.dart';
import 'package:pokemon/app/app_config.dart';
import 'package:pokemon/app/domain/pokemon.dart';
import 'package:pokemon/app/repository/pokemon_repo_interface.dart';

class AllCardsPage extends StatefulWidget {

  const AllCardsPage({Key? key}) : super(key: key);

  @override
  State<AllCardsPage> createState() => _AllCardsPageState();
}

class _AllCardsPageState extends State<AllCardsPage> {
  List<Pokemon> pokemonList = [];
  late PokemonRepoInterface repository;

  @override
  Widget build(BuildContext context) {
    repository = AppConfig.of(context)!.pokemonRepo;
    loadAllPokemon();

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

  void loadAllPokemon() async {
    var allPokemon = await repository.getAllPokemon();
    setState(() {
      pokemonList = allPokemon;
    });
  }

  openDetailScreen(Pokemon pokemon) {
    Navigator.of(context).pushNamed('/detail', arguments: {'pokemon': pokemon});
  }
}
