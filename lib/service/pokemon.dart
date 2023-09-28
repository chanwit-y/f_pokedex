import 'dart:convert';

import 'package:f_pokedex/model/PokemonDetailModel.dart';
import 'package:http/http.dart' as http;
import '../model/PokedexModel.dart';

class PokedexService {
  Future<List<PokemonDetail>> getPokemon(int limit, offset) async {
    List<PokemonDetail> result = [];
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
    var response = await http.get(url);
    var pokedex = PokedexModel.fromJson(json.decode(response.body));

    for (var element in (pokedex.results ?? [])) {
      print(element.name);
      result.add(await getPokemonDetail(element.url ?? ""));
    }

    return result;
  }

  Future<PokemonDetail> getPokemonDetail(String url) async {
    var response = await http.get(Uri.parse(url));
    var pokemonDetail = PokemonDetail.fromJson(json.decode(response.body));
    return pokemonDetail;
  }
}
