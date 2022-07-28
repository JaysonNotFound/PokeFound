import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failure/failure.dart';

part 'pokemon_failure.freezed.dart';

@freezed
class PokemonFailure with _$PokemonFailure implements Failure {
  factory PokemonFailure() = _PokemonFailure;
}
