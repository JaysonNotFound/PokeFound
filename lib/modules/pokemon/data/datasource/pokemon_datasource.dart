import 'package:injectable/injectable.dart';

import '../../../../core/http/http_client.dart';
import '../../../../helper/remote_exception/remote_exception_helper.dart';
import '../model/pokemon_details/pokemon_details_model.dart';
import '../model/pokemon_list/pokemon_list_model.dart';

@injectable
class PokemonDatasource {
  final HttpClient _httpClient;
  final RemoteExceptionHelper _remoteExceptionHelper;

  PokemonDatasource({
    required HttpClient httpClient,
    required RemoteExceptionHelper remoteExceptionHelper,
  })  : _httpClient = httpClient,
        _remoteExceptionHelper = remoteExceptionHelper;

  static const String gistApiUrl = 'https://gist.github.com/JaysonNotFound/';
  static const String pokeApiUrl = 'https://pokeapi.co/api/v2/';

  Future<PokemonListModel> getPokemons() async {
    final response = await _httpClient
        .get(
          '7482eaa4ba17e4d978a151377cfd9aec/raw/pokemons.json',
          baseUrl: gistApiUrl,
        )
        .catchError(_remoteExceptionHelper.call);

    return PokemonListModel.fromJson(response.data);
  }

  Future<PokemonDetailsModel> getPokemonById(int id) async {
    final response = await _httpClient
        .get(
          'pokemon/${id.toString()}',
          baseUrl: pokeApiUrl,
        )
        .catchError(_remoteExceptionHelper.call);

    return PokemonDetailsModel.fromJson(response.data);
  }
}
