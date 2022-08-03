part of 'pokemon_details_bloc.dart';

@freezed
class PokemonDetailsEvent with _$PokemonDetailsEvent {
  const factory PokemonDetailsEvent.getPokemonById({
    required int id,
  }) = _GetPokemonById;
}
