part of 'chrarcterdetails_bloc.dart';

@immutable
sealed class ChrarcterdetailsEvent {}

class CharacterDetailsFetch extends ChrarcterdetailsEvent {
  final String url;

  CharacterDetailsFetch({required this.url});
}
