import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'detailPage.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokedex",
    theme: ThemeData(useMaterial3: true),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                  child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                childAspectRatio: 1.4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      print("tap");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // ElevatedButton(
                          //     onPressed: () {
                          //       //wrong way: use context in same level tree with MaterialApp
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => DetailPage()));
                          //     },
                          //     child: const Text('SCAN')),
                          const Positioned(
                              child: Text(
                            "Bulbasaur",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SvgPicture.network(
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
  }
}
