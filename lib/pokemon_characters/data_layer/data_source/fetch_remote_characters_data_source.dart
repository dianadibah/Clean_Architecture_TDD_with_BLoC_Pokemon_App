import 'package:dio/dio.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/core/functions/web_services.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';

abstract class FetchRemoteCharactersDataSource {
  Future<List<PokemonModel>> fetchCharacters(QueryParams queryParams);
}

class FetchRemoteCharactersDataSourceImp
    extends FetchRemoteCharactersDataSource {
  final webServices = WebServices(Dio());

  @override
  Future<List<PokemonModel>> fetchCharacters(QueryParams queryParams) async {
    var data = await webServices.get(
      path: "https://pokeapi.co/api/v2/pokemon",
      params: queryParams,
    );
    // ignore: avoid_print
    print(data);
    List<PokemonModel> characters = getCharacters(data);
    return characters;
  }

  List<PokemonModel> getCharacters(Map<String, dynamic> data) {
    List<PokemonModel> characters = [];
    for (var data in data["results"]) {
      characters.add(PokemonModel.fromJson(data));
    }
    return characters;
  }
}
