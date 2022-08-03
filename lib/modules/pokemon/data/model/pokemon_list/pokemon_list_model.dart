import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_list_item_model.dart';

part 'pokemon_list_model.freezed.dart';
part 'pokemon_list_model.g.dart';

@freezed
class PokemonListModel with _$PokemonListModel {
  factory PokemonListModel({
    required List<PokemonListItemModel> results,
  }) = _PokemonListModel;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListModelFromJson(json);
}
