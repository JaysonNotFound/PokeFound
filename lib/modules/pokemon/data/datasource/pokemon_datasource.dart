import 'package:injectable/injectable.dart';

import '../../../../helper/http/http_gist_api_helper.dart';
import '../../../../helper/http/http_poke_api_helper.dart';
import '../../../../helper/remote_exception/remote_exception_helper.dart';
import '../model/pokemon_details/pokemon_details_model.dart';
import '../model/pokemon_list/pokemon_list_model.dart';

@injectable
class PokemonDatasource {
  final HttpGistApiHelper _gistApiHelper;
  final HttpPokeApiHelper _pokeApiHelper;

  final RemoteExceptionHelper _remoteExceptionHelper;

  PokemonDatasource({
    required HttpGistApiHelper gistApiHelper,
    required HttpPokeApiHelper pokeApiHelper,
    required RemoteExceptionHelper remoteExceptionHelper,
  })  : _gistApiHelper = gistApiHelper,
        _pokeApiHelper = pokeApiHelper,
        _remoteExceptionHelper = remoteExceptionHelper;

  Future<PokemonListModel> getPokemons() async {
    final response = await _gistApiHelper
        .get('7482eaa4ba17e4d978a151377cfd9aec/raw/pokemons.json')
        .catchError(_remoteExceptionHelper.assureRemoteException);

    return PokemonListModel.fromJson(response.data);
  }

  Future<PokemonDetailsModel> getPokemonById(int id) async {
    final response = await _pokeApiHelper
        .get('pokemon/${id.toString()}')
        .catchError(_remoteExceptionHelper.assureRemoteException);

    return PokemonDetailsModel.fromJson(response.data);
  }
}
