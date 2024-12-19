import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/core/errors/handling_exceptions_manager.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/data_source/fetch_remot_characters_details_data_source.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/data_source/fetch_remote_characters_data_source.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_details_model.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/repository/characterrs_repository.dart';

import '../../../core/errors/server_exception.dart';

class CharactersRepositoryDataImp
    with HandlingExceptionManager
    implements CharactersRepository {
  final FetchRemoteCharactersDataSourceImp fetchRemoteCharactersDataSource =
      FetchRemoteCharactersDataSourceImp();
  final fetchRemoteCharactersDetailsDataSourceImp =
      FetchRemoteCharactersDetailsDataSourceImp();
  @override
  Future<Either<Failure, List<PokemonModel>>> fetchCharacters(
      QueryParams queryParams) async {
    return wrapHandling(
      tryCall: () async {
      List<PokemonModel> characters =
          await fetchRemoteCharactersDataSource.fetchCharacters(queryParams);
      return characters;
    });
  }

  @override
  Future<Either<Failure, PokemonDetailsModel>> fetchCharactersDetails(
      QueryParams queryParams) async {
    return wrapHandling(tryCall: () async {
      PokemonDetailsModel pokemonDetailsModel =
          await fetchRemoteCharactersDetailsDataSourceImp
              .fetchCharactersDetails(queryParams);
      return pokemonDetailsModel;
    });
  }
}
