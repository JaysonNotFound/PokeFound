part of 'pokemon_bloc.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.initial() = _Initial;
  const factory PokemonState.loading() = _Loading;
  const factory PokemonState.success({
    required List<PokemonEntity> pokemons,
  }) = _Success;
  const factory PokemonState.failed() = _Failed;
}
