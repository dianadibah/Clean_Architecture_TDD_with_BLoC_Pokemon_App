import 'package:hive/hive.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';

class PokemonAdapter extends TypeAdapter<PokemonModel> {
  @override
  PokemonModel read(BinaryReader reader) {
    return PokemonModel(name: reader.readString(), url: reader.readString());
  }

  @override
  int get typeId => 0.hashCode;

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer.writeString(obj.name!);
    writer.writeString(obj.url!);

  }
}
