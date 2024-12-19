// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_bloc.dart';

// @immutable
// final class CharactersInitial extends CharactersState {}

// final class CharactersLoading extends CharactersState {}

// final class CharactersLoadingPagenation extends CharactersState {}

// final class CharactersSuccess extends CharactersState {
//   final List<PokemonModel> characters;
//   late bool isLoaded;
//   CharactersSuccess(this.characters, this.isLoaded);
// }

// final class CharactersFailure extends CharactersState {
//   final String message;

//   CharactersFailure(this.message);
// }


enum GetCharacterDetailsStatus { initial, loading, success, failure }

class CharacterDetailsState {
  final String url;
  final PokemonDetailsModel? pokemonDetailsModel;
  final GetCharacterDetailsStatus status;
  final String messageError;

  CharacterDetailsState({
    this.messageError = "",
    this.url = "",
    this.pokemonDetailsModel,
    this.status = GetCharacterDetailsStatus.initial,
  });

  CharacterDetailsState copyWith({
    String? messageError,
    String? url,
    PokemonDetailsModel? pokemonDetailsModel,
    GetCharacterDetailsStatus? status,
  }) {
    return CharacterDetailsState(
      messageError: messageError ?? this.messageError,
      url: url ?? this.url,
      pokemonDetailsModel: pokemonDetailsModel ?? pokemonDetailsModel,
      status: status ?? this.status,
    );
  }
}
enum GetCharactersStatus { initial, loading, success, failure }

class CharactersState {
  final bool isEndpage;
  final String messageError;
  final List<CharacterDetailsState> characterDetailsState;
  final GetCharactersStatus getCharactersState;

  CharactersState(
      {this.characterDetailsState = const [],
      this.isEndpage = false,
      this.getCharactersState = GetCharactersStatus.initial,
      this.messageError = ""});

  CharactersState copyWith(
      {
        List<CharacterDetailsState>? characterDetailsState,
      bool? isEndpage,
      String? messageError,
      GetCharactersStatus? getCharactersState}) {
    return CharactersState(
      characterDetailsState:
          characterDetailsState ?? this.characterDetailsState,
      messageError: messageError ?? this.messageError,
      isEndpage: isEndpage ?? this.isEndpage,
      getCharactersState: getCharactersState ?? this.getCharactersState,
    );
  }
}
