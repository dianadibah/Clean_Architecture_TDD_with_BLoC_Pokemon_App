part of 'chrarcterdetails_bloc.dart';

enum GetCharacterDetailsState { initial, loading, success, failure }

class CharacterDetailsState {
  final String url;
  final PokemonDetailsModel? pokemonDetailsModel;
  final GetCharacterDetailsState status;
  final String messageError;

  CharacterDetailsState({
    this.messageError="",
     this.url="",
    this.pokemonDetailsModel,
     this.status=GetCharacterDetailsState.initial,
  });

  CharacterDetailsState copyWith({
    String? messageError,
    String? url,
    PokemonDetailsModel? pokemonDetailsModel,
    GetCharacterDetailsState? status,
  }){
    return CharacterDetailsState(
      messageError: messageError??this.messageError,
      url: url ?? this.url,
      pokemonDetailsModel: pokemonDetailsModel ?? pokemonDetailsModel,
      status: status ?? this.status,
    );
  }
}
