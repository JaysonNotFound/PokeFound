import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repository/pokemon_repository.dart';
import '../../../domain/entity/pokemon_details_entity.dart';

part 'pokemon_card_bloc.freezed.dart';
part 'pokemon_card_event.dart';
part 'pokemon_card_state.dart';

@injectable
class PokemonCardBloc extends Bloc<PokemonCardEvent, PokemonCardState> {
  final PokemonRepository _pokemonRepository;

  PokemonCardBloc({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(_Initial()) {
    on<PokemonCardEvent>(
      (event, emit) => event.when(
        getPokemonById: (id) => _handleGetPokemonById(emit, id),
      ),
    );
  }

  FutureOr<void> _handleGetPokemonById(
    Emitter<PokemonCardState> emit,
    int id,
  ) async {
    emit(const PokemonCardState.initial());
    emit(const PokemonCardState.loading());

    final result = await _pokemonRepository.getPokemonById(id);
    if (result.isLeft()) {
      return emit(const PokemonCardState.failed());
    }

    final entity = result.getOrElse(() => null);
    if (entity == null) {
      return emit(const PokemonCardState.failed());
    }

    return emit(PokemonCardState.success(entity: entity));
  }
}
