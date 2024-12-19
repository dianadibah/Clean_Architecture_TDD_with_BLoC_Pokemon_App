import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/repository/character_repository_data.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/use_cases/fetch_characters_details_use_case.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/use_cases/fetch_characters_use_case.dart';
import '../../../../core/constant/dropple_pro_max.dart';
import '../../../data_layer/models/pokemon_details_model.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final _limit = 10;
  final fetchCharactersUseCase =
      FetchCharactersUseCase(CharactersRepositoryDataImp());
  final fetchCharactersDetailsUseCase =
      FetchCharactersDetailsUseCase(CharactersRepositoryDataImp());
  CharactersBloc() : super(CharactersState()) {
    on<CharacterFetch>(
      _getPokemons,
      transformer: droppableProMax(),
    );
  }

  FutureOr<void> _getPokemons(
      CharacterFetch event, Emitter<CharactersState> emit) async {
    log("message");
    if (state.getCharactersState == GetCharactersStatus.initial ||
        event.isReload) {
      emit(state.copyWith(getCharactersState: GetCharactersStatus.loading));
      var resulte = await fetchCharactersUseCase(
          GetPokemonsParam(offset: 1, limit: _limit));
      resulte.fold(
          (failure) => emit(state.copyWith(
              getCharactersState: GetCharactersStatus.failure,
              messageError: failure.message)), (pokemons) {
        List<CharacterDetailsState> details = [];
        for (var item in pokemons) {
          details.add(CharacterDetailsState(
              url: item.url!, status: GetCharacterDetailsStatus.initial));
        }
        emit(state.copyWith(
            getCharactersState: GetCharactersStatus.success,
            isEndpage: pokemons.length < _limit,
            characterDetailsState: details));
        for (var item in details) {
          add(CharacterDetailsFetch(url: item.url));
        }
      });
    } else if (!state.isEndpage) {
      emit(state.copyWith(getCharactersState: GetCharactersStatus.loading));
      var resulte = await fetchCharactersUseCase(
        GetPokemonsParam(
          offset: state.characterDetailsState.length + 1,
          limit: _limit,
        ),
      );
      resulte.fold(
          (failure) => emit(state.copyWith(
              getCharactersState: GetCharactersStatus.failure,
              messageError: failure.message)), (pokemons) {
        List<CharacterDetailsState> details = [];
        for (var item in pokemons) {
          details.add(CharacterDetailsState(
              url: item.url!, status: GetCharacterDetailsStatus.failure));
        }
        emit(state.copyWith(
            getCharactersState: GetCharactersStatus.success,
            isEndpage: pokemons.length < _limit,
            characterDetailsState: List.of(state.characterDetailsState)
              ..addAll(details)));

        for (var item in details) {
          add(CharacterDetailsFetch(url: item.url));
        }
      });
    }

    on<CharacterDetailsFetch>(
      transformer: sequential(),
      (event, emit) async {
        for (int i = 0; i < state.characterDetailsState.length; i++) {
          if (event.url == state.characterDetailsState[i].url) {
            var list = List.of(state.characterDetailsState);
            list[i] =
                list[i].copyWith(status: GetCharacterDetailsStatus.loading);
            emit(state.copyWith(characterDetailsState: list));
            var result = await fetchCharactersDetailsUseCase(
                GetPokemonsDetailsParam(url: list[i].url));
            result.fold(
              (failure) {
                var list = List.of(state.characterDetailsState);
                list[i] = list[i].copyWith(
                  status: GetCharacterDetailsStatus.failure,
                  messageError: failure.message,
                );
                emit(state.copyWith(characterDetailsState: list));
              },
              (pokemonDetails) {
                var list = List.of(state.characterDetailsState);
                list[i] = list[i].copyWith(
                    status: GetCharacterDetailsStatus.success,
                    pokemonDetailsModel: pokemonDetails);
                emit(state.copyWith(characterDetailsState: list));
              },
            );
          }
        }
      },
    );
  }
}
