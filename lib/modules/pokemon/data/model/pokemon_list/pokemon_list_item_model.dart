import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_list_item_type_model.dart';

part 'pokemon_list_item_model.freezed.dart';
part 'pokemon_list_item_model.g.dart';

@freezed
class PokemonListItemModel with _$PokemonListItemModel {
  factory PokemonListItemModel({
    @JsonKey(name: 'default_id') required int defaultId,
    required int id,
    required String name,
    required List<PokemonListItemTypeModel> types,
    required String image,
  }) = _PokemonListItemModel;

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemModelFromJson(json);
}
