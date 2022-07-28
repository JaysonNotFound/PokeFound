import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_ability_entity.freezed.dart';

@freezed
class PokemonDetailsAbilityEntity with _$PokemonDetailsAbilityEntity {
  factory PokemonDetailsAbilityEntity({
    required int id,
    required String name,
    required bool isHidden,
    required int slot,
  }) = _PokemonDetailsAbilityEntity;
}
