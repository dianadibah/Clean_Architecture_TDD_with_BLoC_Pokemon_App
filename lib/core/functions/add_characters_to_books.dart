
  import 'package:hive/hive.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_model.dart';

void addToBox(List<PokemonModel> characters,String name) {
    Box box = Hive.box<PokemonModel>(name);
    box.addAll(characters);
    
  }