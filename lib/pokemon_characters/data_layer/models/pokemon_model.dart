
import 'dart:convert';

List<PokemonModel> pokemonModelFromJson(String str) => List<PokemonModel>.from(json.decode(str).map((x) => PokemonModel.fromJson(x)));

String pokemonModelToJson(List<PokemonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonModel {
    String? name;
    String? url;

    PokemonModel({
        this.name,
        this.url,
    });

    PokemonModel copyWith({
        String? name,
        String? url,
    }) => 
        PokemonModel(
            name: name ?? this.name,
            url: url ?? this.url,
        );

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
