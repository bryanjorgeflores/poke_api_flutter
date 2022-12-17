import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_test/containers/common/bloc/pokemon_bloc.dart';
import 'package:poke_test/containers/pokemon/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<BlocProvider> providers(BuildContext mainContext) {
    return [
      BlocProvider<PokemonBloc>(
          create: (BuildContext context) => PokemonBloc()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(context),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
              toolbarTextStyle: TextStyle(color: Colors.white)),
        ),
        title: 'PokeTest',
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
