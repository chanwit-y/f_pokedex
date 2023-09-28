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
    // _scorllcontroller.addListener(_onScorll);
  }

  bool _onScorllNotification(ScrollNotification scrollNoti) {
    if (scrollNoti.metrics.pixels == scrollNoti.metrics.maxScrollExtent) {
      _loadMore();
    }
    return true;
  }

  _loadMore() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final result =
        await PokedexService().getPokemon(_pageSize, pageIndex * _pageSize);
    pageIndex++;
    setState(() {
      data.addAll(result);
      isLoading = false;
    });
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
              child: Stack(
                children: [
                  Visibility(
                      visible: data.isEmpty && isLoading,
                      child: const Center(child: CircularProgressIndicator())),
                  NotificationListener(
                    onNotification: _onScorllNotification,
                    child: GridView.count(
                        controller: _scorllcontroller,
                        crossAxisCount: 2,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          ...data.map((e) => PokemonCard(
                                pokemonDetail: e,
                              )),
                        ]),
                  ),
                ],
              ),

             
            ),
            if (data.isNotEmpty && isLoading)
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 20,
                  bottom: 0,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              )
          ],
        ),
      ),
    );
  }
}
