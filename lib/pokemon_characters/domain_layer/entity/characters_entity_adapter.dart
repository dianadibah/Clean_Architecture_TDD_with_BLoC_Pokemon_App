import 'package:hive/hive.dart';
import 'package:pokemon_app/pokemon_characters/domain_layer/entity/characters_entity.dart';

class CharactersAdapter extends TypeAdapter<CharactersEntity> {
  @override
  CharactersEntity read(BinaryReader reader) {
    return CharactersEntity(
        characterId: reader.readInt(),
        characterName: reader.readString(),
        characterState: reader.readString(),
        characterType: reader.readString());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, CharactersEntity obj) {
    writer.writeInt(obj.characterId);
    writer.writeString(obj.characterName);
    writer.writeString(obj.characterState);
    writer.writeString(obj.characterType);
  }
}
