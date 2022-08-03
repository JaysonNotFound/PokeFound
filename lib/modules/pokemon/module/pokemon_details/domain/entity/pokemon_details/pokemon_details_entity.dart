import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_details_ability_entity.dart';
import 'pokemon_details_stat_entity.dart';
import 'pokemon_details_type_entity.dart';

part 'pokemon_details_entity.freezed.dart';

@freezed
class PokemonDetailsEntity with _$PokemonDetailsEntity {
  factory PokemonDetailsEntity({
    required int id,
    required String name,
    required List<PokemonDetailsAbilityEntity> abilities,
    required List<PokemonDetailsStatEntity> stats,
    required List<PokemonDetailsTypeEntity> types,
    required int weight,
    required int height,
    required int order,
    required bool isDefault,
  }) = _PokemonDetailsEntity;
}
