import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/constant/colors.dart';
import 'package:pokemon_app/core/functions/gemnerat_color.dart';
import 'package:pokemon_app/core/functions/generate_image_assets.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/bloc/bloc/characters_bloc.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/widgets/custom_widgets/custom_card_characters.dart';

import '../custom_widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<CharactersBloc>(context).add(CharacterFetch());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.backGround,
        appBar: const AppBarApp(),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if ((state.getCharactersState == GetCharactersStatus.initial ||
                    state.getCharactersState == GetCharactersStatus.loading) &&
                state.characterDetailsState.isEmpty) {
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.getCharactersState == GetCharactersStatus.failure &&
                state.characterDetailsState.isEmpty) {
              return Center(
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<CharactersBloc>(context)
                          .add(CharacterFetch(isReload: true));
                    },
                    icon: const Icon(Icons.replay_outlined)),
              );
            }
            return RefreshIndicator(
                child: ListView.builder(
                    itemCount: state.characterDetailsState.length +
                        (state.isEndpage ? 0 : 1),
                    itemBuilder: (context, i) {
                      if (state.characterDetailsState.length == i) {
                        BlocProvider.of<CharactersBloc>(context)
                            .add(CharacterFetch());
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomCardCharacters(
                        key: Key(i.toString()),
                        image: generatImages(i),
                        color: generatColors(i),
                        characterDetailsState: state.characterDetailsState[i],
                      );
                    }),
                onRefresh: () {
                  return Future.delayed(
                    const Duration(seconds: 1),
                    () => BlocProvider.of<CharactersBloc>(context)
                        .add(CharacterFetch(isReload: true)),
                  );
                });
          },
        ),
      ),
    );
  }
}
