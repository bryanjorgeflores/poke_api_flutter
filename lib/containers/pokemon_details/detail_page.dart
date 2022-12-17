import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poke_test/containers/pokemon_details/widgets/card_info.dart';
import 'package:poke_test/domain/common/data/colors.dart';
import 'package:poke_test/domain/pokemon/models/pokemon_model.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late Pokemon pokemon;
  late String currentCover;
  late String pokemonKind;

  @override
  void initState() {
    super.initState();
    setState(() {
      pokemon = widget.pokemon;
      currentCover = pokemon.sprites!.officialArtwork ?? '';
      pokemonKind = pokemon.types!.first.type!.name!;
    });
  }

  calculateCP() {
    int combatPower = pokemon.stats!
        .fold(0, (previousValue, element) => previousValue + element.baseStat!);
    return combatPower;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                pokemon.favorite = !pokemon.favorite!;
              });
            },
            icon: Icon(
              pokemon.favorite! ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: -120,
            top: -100,
            child: Image.asset(
              'assets/images/logo.png',
              height: 400,
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PokemonColors.values
                      .firstWhere((element) => element.code == pokemonKind)
                      .color
                      .withOpacity(0.5),
                  Color.alphaBlend(
                      PokemonColors.values
                          .firstWhere((element) => element.code == pokemonKind)
                          .color,
                      Colors.black)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 255],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 70),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Container(
                                    height: 10,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.35),
                                          blurRadius: 40,
                                          offset: const Offset(0, 0),
                                          spreadRadius: 10,
                                          blurStyle: BlurStyle.normal,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: pokemon.name!,
                                child: Image.network(
                                  currentCover,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset('assets/images/whosthat.png');
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${toBeginningOfSentenceCase(pokemon.name)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          CardInfo(pokemon: pokemon),
                          const SizedBox(height: 20),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: 60,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.limeAccent[700],
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'POWER UP',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/stardust.png',
                                        height: 20,
                                      ),
                                      const Text(
                                        '4,500',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/candy.png',
                                      height: 20,
                                      color: PokemonColors.values
                                          .firstWhere((element) =>
                                              element.code ==
                                              pokemon.types!.first.type!.name)
                                          .color,
                                    ),
                                    const Text(
                                      '4',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20)
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 60,
                        left: 0,
                        child: Text(
                          '${calculateCP()} CP',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
