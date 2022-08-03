import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_list_item_entity.dart';

part 'pokemon_list_entity.freezed.dart';

@freezed
class PokemonListEntity with _$PokemonListEntity {
  factory PokemonListEntity({required List<PokemonListItemEntity> pokemons}) =
      _PokemonListEntity;
}
