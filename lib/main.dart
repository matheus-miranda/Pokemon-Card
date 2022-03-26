import 'package:flutter/material.dart';
import 'package:pokemon/app/app_config.dart';
import 'package:pokemon/app/app_widget.dart';
import 'package:pokemon/app/repository/pokemon_repository.dart';

void main() => runApp(
    AppConfig(
        pokemonRepo: PokemonRepository(),
        child: const AppWidget()
    ));
