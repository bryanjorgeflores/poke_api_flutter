import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:poke_test/containers/pokemon/widgets/skeleton_list.dart';
import 'package:poke_test/containers/pokemon_details/detail_page.dart';
import 'package:poke_test/domain/domain.dart';


class PokemonList extends StatefulWidget {
  final PagingController<int, Pokemon> pagingController;
  const PokemonList({super.key, required this.pagingController});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Pokemon>.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      pagingController: widget.pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (BuildContext context, Pokemon pokemon, int index) {
          String pokemonKind = pokemon.types!.first.type!.name!;
          return InkWell(
            splashColor: Colors.blue,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonDetailsPage(
                          pokemon: pokemon,
                        )),
              );
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Positioned(
                  right: -45,
                  top: -45,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 240,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                Ink(
                  height: 120,
                  decoration: BoxDecoration(
                    color: PokemonColors.values
                        .firstWhere((element) => element.code == pokemonKind)
                        .color
                        .withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '#${pokemon.id.toString().padLeft(3, '0')}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${toBeginningOfSentenceCase(pokemon.name)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Hero(
                          tag: pokemon.name!,
                          child: Image.network(
                            '${pokemon.sprites!.officialArtwork}',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/whosthat.png');
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (Kind kind in pokemon.types!)
                        Container(
                          width: 75,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.only(
                            right: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color.alphaBlend(
                              PokemonColors.values
                                  .firstWhere((element) =>
                                      element.code == kind.type!.name)
                                  .color,
                              Colors.black12,
                            ),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              '${toBeginningOfSentenceCase(kind.type?.name)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      pokemon.favorite!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        pokemon.favorite = !pokemon.favorite!;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
        firstPageProgressIndicatorBuilder: (context) {
          return const SkeletonList();
        },
        newPageProgressIndicatorBuilder: (context) {
          return const SkeletonList();
        },
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
