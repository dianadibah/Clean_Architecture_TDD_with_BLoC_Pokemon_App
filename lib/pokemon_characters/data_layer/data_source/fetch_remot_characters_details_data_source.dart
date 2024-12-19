import 'package:dio/dio.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/core/functions/web_services.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_details_model.dart';

abstract class FetchRemoteCharactersDetailsDataSource {
  Future<PokemonDetailsModel> fetchCharactersDetails(QueryParams param);
}

class FetchRemoteCharactersDetailsDataSourceImp
    extends FetchRemoteCharactersDetailsDataSource {
  final webServices = WebServices(Dio());
  @override
  Future<PokemonDetailsModel> fetchCharactersDetails(QueryParams param) async {
    var data = await webServices.get(
      path: param["url"] ?? "",
    );
    print("Character Details *****************$data");
    PokemonDetailsModel characterDetails = PokemonDetailsModel.fromJson(data);
    return characterDetails;
  }
}
