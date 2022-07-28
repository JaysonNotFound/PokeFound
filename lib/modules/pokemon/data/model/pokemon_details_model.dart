import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_details_ability_model.dart';
import 'pokemon_details_stat_model.dart';
import 'pokemon_details_type_model.dart';

part 'pokemon_details_model.freezed.dart';
part 'pokemon_details_model.g.dart';

@freezed
class PokemonDetailsModel with _$PokemonDetailsModel {
  factory PokemonDetailsModel({
    required int id,
    required List<PokemonDetailsAbility> abilities,
    required List<PokemonDetailsStatModel> stats,
    required List<PokemonDetailsTypeModel> types,
    required Map<String, dynamic> sprites,
    required String name,
    required int weight,
    required int height,
    required int order,
    @JsonKey(name: 'is_default') required bool isDefault,
  }) = _PokemonDetailsModel;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsModelFromJson(json);
}
