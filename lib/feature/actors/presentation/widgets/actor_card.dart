import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_colors.dart';
import 'package:rick_and_morty/core/extentions/int_extention.dart';

class ActorCard extends StatelessWidget {
  final String imageURL;
  final String actorName;
  final String actorLocation;

  const ActorCard(
      {super.key,
      required this.imageURL,
      required this.actorName,
      required this.actorLocation});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      imageURL,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
                8.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            actorName,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            actorLocation,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.gray),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.favorite_outline),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
