import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_list_item_type_entity.dart';

part 'pokemon_list_item_entity.freezed.dart';

@freezed
class PokemonListItemEntity with _$PokemonListItemEntity {
  factory PokemonListItemEntity({
    required int defaultId,
    required int id,
    required String name,
    required List<PokemonListItemTypeEntity> types,
    required String image,
  }) = _PokemonListItemEntity;
}
