import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_details_model.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';

import '../../../core/errors/server_exception.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<PokemonModel>>> fetchCharacters(
      QueryParams queryParams);
  Future<Either<Failure, PokemonDetailsModel>> fetchCharactersDetails(
      QueryParams queryParams);
}
