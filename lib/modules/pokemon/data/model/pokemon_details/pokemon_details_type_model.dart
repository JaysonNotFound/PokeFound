import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_type_model.freezed.dart';
part 'pokemon_details_type_model.g.dart';

@freezed
class PokemonDetailsTypeModel with _$PokemonDetailsTypeModel {
  factory PokemonDetailsTypeModel({
    required Map<String, dynamic> type,
    required int slot,
  }) = _PokemonDetailsTypeModel;

  factory PokemonDetailsTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsTypeModelFromJson(json);
}
