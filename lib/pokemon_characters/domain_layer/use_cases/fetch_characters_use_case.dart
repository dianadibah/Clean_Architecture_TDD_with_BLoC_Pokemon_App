import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/repository/characterrs_repository.dart';

import '../../../core/errors/server_exception.dart';

class FetchCharactersUseCase
    extends UseCase<List<PokemonModel>, GetPokemonsParam> {
  final CharactersRepository charactersRepository;
  FetchCharactersUseCase(this.charactersRepository);

  @override
  Future<Either<Failure, List<PokemonModel>>> call(
      GetPokemonsParam param) async {
    return await charactersRepository.fetchCharacters(param.getParams());
  }
}


class GetPokemonsParam with Params {
  final int? offset;
  final int? limit;
  GetPokemonsParam({required this.offset, required this.limit});
  @override
  QueryParams getParams() => {
        if (offset != null) "offset": offset.toString(),
        if (limit != null) "limit": limit.toString(),
      };
}
    