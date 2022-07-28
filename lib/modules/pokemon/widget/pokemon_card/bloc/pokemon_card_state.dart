part of 'pokemon_card_bloc.dart';

@freezed
class PokemonCardState with _$PokemonCardState {
  const factory PokemonCardState.initial() = _Initial;
  const factory PokemonCardState.loading() = _Loading;
  const factory PokemonCardState.success({
    required PokemonDetailsEntity entity,
  }) = _Success;
  const factory PokemonCardState.failed() = _Failed;
}
