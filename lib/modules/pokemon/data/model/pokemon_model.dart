import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  static int parstToId(String url) => int.parse(
        Uri.parse(url).pathSegments.where((value) => value != '').last,
      );

  factory PokemonModel({
    @JsonKey(name: 'url', fromJson: PokemonModel.parstToId) required int id,
    required String name,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}
