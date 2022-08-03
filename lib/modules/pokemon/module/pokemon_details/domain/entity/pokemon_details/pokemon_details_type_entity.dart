import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details_type_entity.freezed.dart';

@freezed
class PokemonDetailsTypeEntity with _$PokemonDetailsTypeEntity {
  factory PokemonDetailsTypeEntity({
    required int id,
    required String name,
    required int slot,
  }) = _PokemonDetailsTypeEntity;
}
