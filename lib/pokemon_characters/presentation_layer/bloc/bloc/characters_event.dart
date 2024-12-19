part of 'characters_bloc.dart';

sealed class CharactersEvent {}

class CharacterFetch extends CharactersEvent with EventWithReload {
  @override
  final bool isReload;
  
  CharacterFetch({this.isReload = false});
}

class CharacterDetailsFetch extends CharactersEvent {
  final String? url;

  CharacterDetailsFetch({this.url});
}
