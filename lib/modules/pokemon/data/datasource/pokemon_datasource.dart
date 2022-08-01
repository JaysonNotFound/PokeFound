import 'package:injectable/injectable.dart';

import '../../../../helper/http/http_poke_api_helper.dart';
import '../../../../helper/remote_exception/remote_exception_helper.dart';
import '../../domain/params/pokemon_api_params.dart';
import '../model/pokemon_details_model.dart';
import '../model/pokemons_model.dart';

@injectable
class PokemonDatasource {
  final HttpPokeApiHelper _pokeApiHelper;
  final RemoteExceptionHelper _remoteExceptionHelper;

  PokemonDatasource({
    required HttpPokeApiHelper pokeApiHelper,
    required RemoteExceptionHelper remoteExceptionHelper,
  })  : _pokeApiHelper = pokeApiHelper,
        _remoteExceptionHelper = remoteExceptionHelper;

  Future<PokemonsModel> getPokemon(PokemonApiParams params) async {
    final response = await _pokeApiHelper
        .get('pokemon', queryParameters: params.toJson())
        .catchError(_remoteExceptionHelper.assureRemoteException);

    return PokemonsModel.fromJson(response.data);
  }

  Future<PokemonDetailsModel> getPokemonById(int id) async {
    final response = await _pokeApiHelper
        .get('pokemon/${id.toString()}')
        .catchError(_remoteExceptionHelper.assureRemoteException);

    return PokemonDetailsModel.fromJson(response.data);
  }
}
