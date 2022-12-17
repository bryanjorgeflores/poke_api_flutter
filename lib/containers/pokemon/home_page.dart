import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:poke_test/containers/common/bloc/pokemon_bloc.dart';
import 'package:poke_test/containers/common/widgets/toast.dart';
import 'package:poke_test/containers/pokemon/widgets/list.dart';
import 'package:poke_test/containers/pokemon_details/detail_page.dart';
import 'package:poke_test/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);
  late PokemonBloc pokemonBloc;
  int page = 0;
  @override
  void initState() {
    super.initState();
    pokemonBloc = context.read<PokemonBloc>();
    _pagingController.addPageRequestListener(
      (pageKey) => pokemonBloc.add(LoadPokemonsEvent(page: page)),
    );
  }

  @override
  void dispose() {
    pokemonBloc.add(ReinitPokemonsEvent());
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonBloc, PokemonState>(
      listener: (context, state) {
        if (state.isPokemonPageLoaded) {
          bool isLastPage = state.pokemons.length < 10;
          if (!isLastPage) {
            _pagingController.appendPage(state.pokemons, page);
            setState(() {
              page++;
            });
          } else {
            _pagingController.appendLastPage(state.pokemons);
          }
        }
        if (state.hasError) {
          showToast(context, 'Sin resultados para su búsqueda.', Colors.red);
        }
        if (state.isPokemonFounded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailsPage(
                pokemon: state.pokemonResult!,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Pokedéx',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Busca un pokemon por nombre o usando su código de Pokedex',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Ejm. Pikachu o 25',
                            filled: true,
                            fillColor: Colors.grey[200]!,
                            prefixIcon: const Icon(Icons.search),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (val) {
                            if (val.trim().isNotEmpty) {
                              pokemonBloc.add(SearchPokemonEvent(
                                  search: val.trim().toLowerCase()));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Principales',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ];
              },
              body: PokemonList(
                pagingController: _pagingController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
