// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_app/core/constant/colors.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/widgets/custom_widgets/app_bar.dart';

import '../custom_widgets/custom_card_details.dart';

class DetailsScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final Color? color;
final String? type;
  final String? stat;
  const DetailsScreen({Key? key, this.image, this.name,this.color, this.type, this.stat}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: const AppBarApp(),
        body: Center(
            child: CustomCardCharactersDetails(
                image: widget.image!,
                color: widget.color!,
                name: widget.name!,
                stat: widget.stat!,
                type: widget.type!,
                )),
      ),
    );
  }
}
