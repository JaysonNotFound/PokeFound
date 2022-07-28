import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_stat_entity.freezed.dart';

@freezed
class PokemonDetailsStatEntity with _$PokemonDetailsStatEntity {
  factory PokemonDetailsStatEntity({
    required int id,
    required String name,
    required int baseStat,
    required int effort,
  }) = _PokemonDetailsStatEntity;
}
