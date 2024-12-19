import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data_layer/models/pokemon_details_model.dart';
import '../../../../data_layer/repository/character_repository_data.dart';
import '../../../../domain_layer/use_cases/fetch_characters_details_use_case.dart';

part 'chrarcterdetails_event.dart';
part 'chrarcterdetails_state.dart';

class ChrarcterdetailsBloc
    extends Bloc<ChrarcterdetailsEvent, CharacterDetailsState> {
  final fetchCharactersDetailsUseCase =
      FetchCharactersDetailsUseCase(CharactersRepositoryDataImp());
  ChrarcterdetailsBloc() : super(CharacterDetailsState()) {
    on<CharacterDetailsFetch>(_getPokemonDetails);
  }

  FutureOr<void> _getPokemonDetails(
      CharacterDetailsFetch event, Emitter<CharacterDetailsState> emit) async {
    
    if (state.status == GetCharacterDetailsState.initial) {
      emit(state.copyWith(status: GetCharacterDetailsState.loading));
      var resulte = await fetchCharactersDetailsUseCase(
          GetPokemonsDetailsParam(url: state.url));
      resulte.fold(
          (failure) => emit(state.copyWith(
              status: GetCharacterDetailsState.failure,
              messageError: failure.message)),
          (pokemonDetails) => emit(state.copyWith(
                status: GetCharacterDetailsState.success,
                pokemonDetailsModel: pokemonDetails,
              )));
    }
  }
}
