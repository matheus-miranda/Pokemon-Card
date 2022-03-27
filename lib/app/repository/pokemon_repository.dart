import 'package:pokemon/app/domain/pokemon.dart';
import 'package:pokemon/app/repository/pokemon_repo_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepository implements PokemonRepoInterface {
  static const obtainedKey = 'OBTAINED_KEY';
  static const favoritesKey = 'FAVORITES_KEY';

  @override
  void addToObtainedList(Pokemon pokemon) async {
    var shared = await SharedPreferences.getInstance();
    var pokemonList = shared.getStringList(obtainedKey);

      if (pokemonList == null || pokemonList.isEmpty) {
        shared.setStringList(obtainedKey, [pokemon.toJson()]);
      } else {
        pokemonList.add(pokemon.toJson());
        shared.setStringList(obtainedKey, pokemonList);
      }
  }

  @override
  void addToFavoritesList(Pokemon pokemon) async {
    var shared = await SharedPreferences.getInstance();
    var pokemonList = shared.getStringList(favoritesKey);

    if (pokemonList == null || pokemonList.isEmpty) {
      shared.setStringList(favoritesKey, [pokemon.toJson()]);
    } else {
      pokemonList.add(pokemon.toJson());
      shared.setStringList(favoritesKey, pokemonList);
    }
  }

  @override
  Future<List<Pokemon>> getObtainedPokemon() async {
    var shared = await SharedPreferences.getInstance();
    var pokemonList = shared.getStringList(obtainedKey);

    if (pokemonList == null) {
      return [];
    }

    return pokemonList.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  }

  @override
  Future<List<Pokemon>> getFavoritesPokemon() async {
    var shared = await SharedPreferences.getInstance();
    var pokemonList = shared.getStringList(favoritesKey);

    if (pokemonList == null) {
      return [];
    }

    return pokemonList.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  }
}
