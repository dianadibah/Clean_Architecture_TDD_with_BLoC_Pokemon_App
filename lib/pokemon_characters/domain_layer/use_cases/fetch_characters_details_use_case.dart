import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/constant/usecases.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/repository/characterrs_repository.dart';

import '../../../core/errors/server_exception.dart';
import '../../data_layer/models/pokemon_details_model.dart';

class FetchCharactersDetailsUseCase
    extends UseCase<PokemonDetailsModel, GetPokemonsDetailsParam> {
  final CharactersRepository charactersRepository;

  FetchCharactersDetailsUseCase(this.charactersRepository);

  @override
  Future<Either<Failure, PokemonDetailsModel>> call(
      GetPokemonsDetailsParam param) async {
    return await charactersRepository.fetchCharactersDetails(param.getParams());
  }
}

class GetPokemonsDetailsParam with Params {
  final String? url;

  GetPokemonsDetailsParam({required this.url});

  @override
  QueryParams getParams() => {
        if (url != null) "url": url.toString(),
      };
}
