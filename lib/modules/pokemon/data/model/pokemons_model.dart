import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_model.dart';

part 'pokemons_model.freezed.dart';
part 'pokemons_model.g.dart';

@freezed
class PokemonsModel with _$PokemonsModel {
  factory PokemonsModel({
    required int count,
    required List<PokemonModel> results,
    String? next,
    String? previous,
  }) = _PokemonsModel;

  factory PokemonsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonsModelFromJson(json);
}
