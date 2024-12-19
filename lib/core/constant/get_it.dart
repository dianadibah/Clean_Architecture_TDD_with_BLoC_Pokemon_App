import 'package:get_it/get_it.dart';
import 'package:pokemon_app/core/functions/web_services.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/data_source/fetch_remote_characters_data_source.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/repository/character_repository_data.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/use_cases/fetch_characters_use_case.dart';
import 'package:dio/dio.dart';

var sl = GetIt.instance;
Future<void> getInstance() async {
  sl.registerLazySingleton(
      () => FetchCharactersUseCase(sl.get<CharactersRepositoryDataImp>()));
  sl.registerLazySingleton(() => CharactersRepositoryDataImp());
  sl.registerLazySingleton(() => FetchRemoteCharactersDataSourceImp());
  sl.registerLazySingleton(() => WebServices(Dio()));
}
