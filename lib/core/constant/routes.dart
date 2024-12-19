import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/widgets/screens/details_screen.dart';
import 'package:pokemon_app/pokemon_characters/presentation_layer/widgets/screens/home_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => const HomeScreen(),
    "homeScreen/": (context) => const HomeScreen(),
    "detailsScreen/": (context) => const DetailsScreen(),
  };
  static const String homeScreen = "homeScreen/";
  static const String detailsScreen = "detailsScreen/";

}
