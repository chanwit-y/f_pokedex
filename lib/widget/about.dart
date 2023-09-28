import 'package:f_pokedex/model/PokemonDetailModel.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  PokemonDetail pokemonDetail;
  About({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Height"),
            Text(pokemonDetail.height.toString()),
          ],
        )
      ],
    );
  }
}
