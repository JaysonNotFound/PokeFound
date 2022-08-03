part of 'pokemon_details_bloc.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState.initial() = _Initial;
  const factory PokemonDetailsState.loading() = _Loading;
  const factory PokemonDetailsState.success({
    required PokemonDetailsEntity entity,
  }) = _Success;
  const factory PokemonDetailsState.failed() = _Failed;
}
