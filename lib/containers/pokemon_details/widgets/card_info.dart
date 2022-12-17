import 'package:flutter/material.dart';
import 'package:poke_test/domain/common/data/colors.dart';
import 'package:poke_test/domain/pokemon/models/pokemon_model.dart';

class CardInfo extends StatelessWidget {
  final Pokemon pokemon;
  const CardInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '${(pokemon.weight! / 10).toString()} KG',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'WEIGHT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (Kind kind in pokemon.types!)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color.alphaBlend(
                                  PokemonColors.values
                                      .firstWhere((element) =>
                                          element.code == kind.type!.name)
                                      .color,
                                  Colors.black12,
                                ),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${pokemon.types?.map((e) => e.type?.name?.toUpperCase()).join(' / ')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '${(pokemon.height! / 10).toString()} M',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/stardust.png',
                        height: 20,
                      ),
                      const Text(
                        '248,486',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'STARTDUST',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/candy.png',
                        height: 20,
                        color: PokemonColors.values
                            .firstWhere((element) =>
                                element.code == pokemon.types!.first.type!.name)
                            .color,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '16',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${pokemon.name?.toUpperCase()} CANDY',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
