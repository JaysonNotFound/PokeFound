import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_stat_model.freezed.dart';
part 'pokemon_details_stat_model.g.dart';

@freezed
class PokemonDetailsStatModel with _$PokemonDetailsStatModel {
  factory PokemonDetailsStatModel({
    required Map<String, dynamic> stat,
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
  }) = _PokemonDetailsStatModel;

  factory PokemonDetailsStatModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsStatModelFromJson(json);
}
