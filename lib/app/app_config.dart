import 'package:flutter/material.dart';
import 'package:pokemon/app/repository/pokemon_repo_interface.dart';

class AppConfig extends InheritedWidget {
  final PokemonRepoInterface pokemonRepo;

  const AppConfig(
      {Key? key,
      required Widget child,
      required this.pokemonRepo}
      ) : super(key: key, child: child);

  static AppConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>();

  @override
  bool updateShouldNotify(_) => false; // updates to data don't update the UI
}
