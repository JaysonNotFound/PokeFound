import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_api_params.freezed.dart';
part 'pokemon_api_params.g.dart';

@freezed
class PokemonApiParams with _$PokemonApiParams {
  factory PokemonApiParams({
    @JsonKey(includeIfNull: false) int? limit,
    @JsonKey(includeIfNull: false) int? offset,
  }) = _PokemonApiParams;

  factory PokemonApiParams.fromJson(Map<String, dynamic> json) =>
      _$PokemonApiParamsFromJson(json);
}
