import 'package:f_pokedex/widget/card.dart';
import 'package:flutter/material.dart';

import 'model/PokemonDetailModel.dart';
import 'service/pokemon.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokedex",
    theme: ThemeData(useMaterial3: true),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pageSize = 20;
  final _scorllcontroller = ScrollController();

  var isLoading = false;
  var pageIndex = 0;
  List<PokemonDetail> data = [];

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scorllcontroller.addListener(_onScorll);
  }

  _onScorll() async {
    if (_scorllcontroller.position.pixels ==
        _scorllcontroller.position.maxScrollExtent) {
      _loadMore();
    }
  }

  _loadMore() async {
    if (isLoading) return;
    isLoading = true;
    final result =
        await PokedexService().getPokemon(_pageSize, pageIndex * _pageSize);
    pageIndex++;
    setState(() {
      data.addAll(result);
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: !isLoading && data.isNotEmpty
                  ? GridView.count(
                      controller: _scorllcontroller,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        ...data.map((e) => PokemonCard(
                              pokemonDetail: e,
                            )),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            // Text(isLoadMore.toString()),
            // if(isLoadMore)
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Center(
              //     child: SizedBox(
              //         height: 30, width: 30, child: CircularProgressIndicator()),
              //   ),
              // )
          ],
        ),
      ),
    );
  }
}
