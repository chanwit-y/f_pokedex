import 'package:f_pokedex/extension/ex_string.dart';
import 'package:f_pokedex/model/PokemonDetailModel.dart';
import 'package:f_pokedex/screen/detail.dart';
import 'package:f_pokedex/widget/type.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  PokemonDetail pokemonDetail;

  PokemonCard({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => Detail(
                      pokemonDetail: pokemonDetail,
                    ))
            // PageRouteBuilder(
            //     transitionDuration: const Duration(milliseconds: 500),
            //     pageBuilder: (context, animation, secondaryAnimation) => Detail(
            //           pokemonDetail: pokemonDetail,
            //         )),
            );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (pokemonDetail.types![0].type?.name ?? "").toTypeColor(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Hero(
                  tag: pokemonDetail.id.toString(),
                  child: pokemonDetail.id.toString().toSvg(70, 70)),
            ),
            Positioned(
                left: 0,
                top: 30,
                child: PokemonType(types: pokemonDetail.types ?? [])),
            Text(
              (pokemonDetail.name ?? "").toUpperCaseFirst(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
