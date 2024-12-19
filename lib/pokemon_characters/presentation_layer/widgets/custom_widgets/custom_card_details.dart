import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constant/colors.dart';

class CustomCardCharactersDetails extends StatelessWidget {
  final Color color;
  final String name;
  final String image;
  final String type;
  final String stat;
  const CustomCardCharactersDetails(
      {super.key,
      required this.color,
      required this.name,
      required this.image,
      required this.type,
      required this.stat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 40,
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Positioned(
            child: InkWell(
              child: Container(
                height: MediaQuery.of(context).size.width / 5.5,
                width: MediaQuery.of(context).size.width / 1.3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
              ),
            ),
          ),
          Positioned(
              left: 5,
              top: -15,
              child: Image.asset(
                image,
                height: 100,
              )),
          Positioned(
            right: 30,
            top: 25,
            child: Text(
              name,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Positioned(
              bottom: 60,
              left: 30,
              child: Column(
                children: [
                  Text(
                    "Type: $type",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "State: $stat",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
