import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constant/colors.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/bloc/bloc/characters_bloc.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/widgets/screens/details_screen.dart';

import '../../../../core/constant/info_widget.dart';

class CustomCardCharacters extends StatelessWidget {
  final Color color;
  final String image;
  final CharacterDetailsState characterDetailsState;

  const CustomCardCharacters({
    super.key,
    required this.color,
    required this.image,
    required this.characterDetailsState,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: ((context, deviceInfo) {
      return SizedBox(
        height: deviceInfo.screenHeight! / 7,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: InkWell(
                onTap: () {
                  if (characterDetailsState.status ==
                      GetCharacterDetailsStatus.success) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                image: image,
                                name: characterDetailsState
                                    .pokemonDetailsModel!.name!,
                                color: color,
                                stat: characterDetailsState.pokemonDetailsModel!
                                    .stats!.first.stat!.name,
                                type: characterDetailsState.pokemonDetailsModel!
                                    .types!.first.type!.name)));
                  }
                },
                child: InfoWidget(builder: (context, deviceInfo) {
                  return Container(
                    height: deviceInfo.localHeight! * 0.6,
                    width: deviceInfo.localWidth! * 0.7,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    child: InfoWidget(builder: ((context, deviceInfo) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            image,
                            height: deviceInfo.localHeight! * 2,
                          ),
                          (characterDetailsState.status ==
                                      GetCharacterDetailsStatus.loading ||
                                  characterDetailsState.status ==
                                      GetCharacterDetailsStatus.initial)
                              ? const CircularProgressIndicator()
                              : (characterDetailsState.status ==
                                      GetCharacterDetailsStatus.failure)
                                  ? Center(
                                      child: Text(
                                          characterDetailsState.messageError),
                                    )
                                  : (characterDetailsState.status ==
                                          GetCharacterDetailsStatus.success)
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              characterDetailsState
                                                  .pokemonDetailsModel!.name!,
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      deviceInfo.localHeight! /
                                                          3),
                                            ),
                                            Text(
                                              characterDetailsState
                                                  .pokemonDetailsModel!
                                                  .stats!
                                                  .first
                                                  .stat!
                                                  .name!,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      deviceInfo.localHeight! /
                                                          4),
                                            ),
                                          ],
                                        )
                                      : const Center(child: Text("Noooo Data")),
                        ],
                      );
                    })),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
