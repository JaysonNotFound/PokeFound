import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/pokemon_repository.dart';
import '../entity/pokemon_entity.dart';

part 'pokemon_bloc.freezed.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;

  PokemonBloc({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(_Initial()) {
    on<PokemonEvent>(
      (event, emit) => event.when(
        getPokemons: () => _handleGetPokemons(emit),
      ),
    );
  }

  FutureOr<void> _handleGetPokemons(Emitter<PokemonState> emit) async {
    emit(const PokemonState.initial());
    emit(const PokemonState.loading());

    final result = await _pokemonRepository.getPokemon();
    if (result.isLeft()) {
      return emit(const PokemonState.failed());
    }

    final pokemons = result.getOrElse(() => null);
    if (pokemons != null) {
      return emit(PokemonState.success(pokemons: pokemons));
    }

    return emit(PokemonState.success(pokemons: []));
  }
}
