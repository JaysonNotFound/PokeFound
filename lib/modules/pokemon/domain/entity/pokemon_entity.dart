import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_entity.freezed.dart';

@freezed
class PokemonEntity with _$PokemonEntity {
  factory PokemonEntity({
    required int id,
    required String name,
    required String officialArtWork,
  }) = _PokemonEntity;
}
