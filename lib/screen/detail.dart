import 'package:f_pokedex/extension/ex_string.dart';
import 'package:f_pokedex/model/PokemonDetailModel.dart';
import 'package:f_pokedex/widget/about.dart';
import 'package:f_pokedex/widget/type.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  PokemonDetail pokemonDetail;

  Detail({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemonDetail.types![0].type?.name?.toTypeColor(),
      appBar: AppBar(
        backgroundColor: pokemonDetail.types![0].type?.name?.toTypeColor(),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (pokemonDetail.name ?? "").toUpperCaseFirst(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '#${pokemonDetail.id.toString()}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PokemonType(types: pokemonDetail.types ?? [], isRow: true,),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 90),
                    height: 650,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.white),
                    child: DefaultTabController(
                      length: 4,
                      child: Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          bottom: TabBar(
                            indicatorColor: pokemonDetail.types![0].type?.name
                                ?.toTypeColor(),
                            tabs: const [
                               Tab(
                                text: "About",
                              ),
                              Tab(
                                text: "Base Stats",
                              ),
                              Tab(
                                text: "Evolution",
                              ),
                              Tab(
                                text: "Moves",
                              ),
                            ],
                          ),
                        ),
                        body: About(pokemonDetail: pokemonDetail),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Hero(
                    tag: pokemonDetail.id.toString(),
                    child: (pokemonDetail.id.toString().toSvg(200, 200)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
