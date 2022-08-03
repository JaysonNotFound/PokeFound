import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/repository/pokemon_repository.dart';
import '../entity/pokemon_details/pokemon_details_entity.dart';

part 'pokemon_details_bloc.freezed.dart';
part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

@injectable
class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonRepository _pokemonRepository;

  PokemonDetailsBloc({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(_Initial()) {
    on<PokemonDetailsEvent>(
      (event, emit) => event.when(
        getPokemonById: (id) => _handleGetPokemonById(emit, id),
      ),
    );
  }

  FutureOr<void> _handleGetPokemonById(
    Emitter<PokemonDetailsState> emit,
    int id,
  ) async {
    emit(const PokemonDetailsState.initial());
    emit(const PokemonDetailsState.loading());

    final result = await _pokemonRepository.getPokemonById(id);
    final entity = result.getOrElse(() => null);
    if (entity == null) {
      return emit(const PokemonDetailsState.failed());
    }

    return emit(PokemonDetailsState.success(entity: entity));
  }
}
