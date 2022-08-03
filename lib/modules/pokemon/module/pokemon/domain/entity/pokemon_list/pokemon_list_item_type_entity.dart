import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../core/enum/pokemon/pokemon_type.dart';

part 'pokemon_list_item_type_entity.freezed.dart';

@freezed
class PokemonListItemTypeEntity with _$PokemonListItemTypeEntity {
  factory PokemonListItemTypeEntity({
    required int id,
    required PokemonType type,
    required int slot,
  }) = _PokemonListItemTypeEntity;
}
