part of 'pokemon_card_bloc.dart';

@freezed
class PokemonCardEvent with _$PokemonCardEvent {
  const factory PokemonCardEvent.getPokemonById({
    required int id,
  }) = _GetPokemonById;
}
