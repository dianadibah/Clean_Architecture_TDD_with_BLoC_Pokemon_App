import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/core/constant/get_it.dart';
import 'package:pokemon_app/core/constant/routes.dart';
import 'package:pokemon_app/pokemon_characters/data_layer/models/pokemon_adapter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/bloc/bloc/characters_bloc.dart';

void main() async {
  Hive.registerAdapter(PokemonAdapter());
  await getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CharactersBloc>(create: (context) {
            return CharactersBloc();
          })
        ],
        child: MaterialApp(
          routes: AppRoutes.routes,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
        ));
  }
}
