import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/remote/remote_failure.dart';
import '../../../../helper/remote_failure/remote_failure_helper.dart';
import '../../domain/entity/pokemon_details_ability_entity.dart';
import '../../domain/entity/pokemon_details_entity.dart';
import '../../domain/entity/pokemon_details_stat_entity.dart';
import '../../domain/entity/pokemon_details_type_entity.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../../domain/params/pokemon_api_params.dart';
import '../datasource/pokemon_datasource.dart';

@injectable
class PokemonRepository {
  final PokemonDatasource _datasource;
  final RemoteFailureHelper _remoteFailureHelper;

  PokemonRepository({
    required PokemonDatasource datasource,
    required RemoteFailureHelper remoteFailureHelper,
  })  : _datasource = datasource,
        _remoteFailureHelper = remoteFailureHelper;

  Future<Either<RemoteFailure?, List<PokemonEntity>?>> getPokemon() async {
    try {
      final params = PokemonApiParams(limit: 898);
      final model = await _datasource.getPokemon(params);
      const officalArtworkUri =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';

      final results = model.results
          .map(
            (poke) => PokemonEntity(
              id: poke.id,
              name: poke.name,
              officialArtWork: '$officalArtworkUri/${poke.id}.png',
            ),
          )
          .toList();
      return Right(results);
    } on Exception catch (exception) {
      return Left(_remoteFailureHelper.call(exception));
    }
  }

  Future<Either<RemoteFailure?, PokemonDetailsEntity?>> getPokemonById(
    int id,
  ) async {
    try {
      final model = await _datasource.getPokemonById(id);
      final _officialArtWork =
          model.sprites['other']['official-artwork']['front_default'];

      final _abilities = model.abilities
          .map((ability) => PokemonDetailsAbilityEntity(
                id: _getIdFromUrl(ability.ability['url']),
                name: ability.ability['name'],
                isHidden: ability.isHidden,
                slot: ability.slot,
              ))
          .toList();

      final _stats = model.stats
          .map((stat) => PokemonDetailsStatEntity(
                id: _getIdFromUrl(stat.stat['url']),
                name: stat.stat['name'],
                baseStat: stat.baseStat,
                effort: stat.effort,
              ))
          .toList();

      final _types = model.types
          .map((type) => PokemonDetailsTypeEntity(
                id: _getIdFromUrl(type.type['url']),
                name: type.type['name'],
                slot: type.slot,
              ))
          .toList();

      final entity = PokemonDetailsEntity(
        id: model.id,
        name: model.name,
        weight: model.weight,
        height: model.height,
        order: model.order,
        isDefault: model.isDefault,
        officialArtWork: _officialArtWork,
        abilities: _abilities,
        stats: _stats,
        types: _types,
      );

      return Right(entity);
    } on Exception catch (exception) {
      return Left(_remoteFailureHelper.call(exception));
    }
  }

  int _getIdFromUrl(String url) => int.parse(
        Uri.parse(url).pathSegments.where((value) => value != '').last,
      );
}
