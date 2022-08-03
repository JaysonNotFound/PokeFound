import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enum/pokemon/pokemon_type.dart';

part 'pokemon_list_item_type_model.freezed.dart';
part 'pokemon_list_item_type_model.g.dart';

@freezed
class PokemonListItemTypeModel with _$PokemonListItemTypeModel {
  factory PokemonListItemTypeModel({
    required int id,
    @JsonKey(name: 'name', unknownEnumValue: PokemonType.unknown)
        required PokemonType type,
    required int slot,
  }) = _PokemonListItemTypeModel;

  factory PokemonListItemTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemTypeModelFromJson(json);
}
