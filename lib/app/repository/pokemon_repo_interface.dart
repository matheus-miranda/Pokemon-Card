import 'package:pokemon/app/domain/pokemon.dart';

abstract class PokemonRepoInterface {
  void addToFavoritesList(Pokemon pokemon);
  void addToObtainedList(Pokemon pokemon);
  Future<List<Pokemon>> getObtainedPokemon();
}
