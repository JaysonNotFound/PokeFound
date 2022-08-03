import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_ability_model.freezed.dart';
part 'pokemon_details_ability_model.g.dart';

@freezed
class PokemonDetailsAbility with _$PokemonDetailsAbility {
  factory PokemonDetailsAbility({
    required Map<String, dynamic> ability,
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required int slot,
  }) = _PokemonDetailsAbility;

  factory PokemonDetailsAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsAbilityFromJson(json);
}
