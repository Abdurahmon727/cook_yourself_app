// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remote_recipe/assets/images/images.dart';
import 'package:remote_recipe/features/home/domain/entity/recipe.dart';

import '../../../../assets/colors/colors.dart';
import '../../../../assets/icons/icons.dart';

class WMenuRecipe extends StatelessWidget {
  const WMenuRecipe({
    Key? key,
    required this.entity,
  }) : super(key: key);
  final RecipeEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(4, 0),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              height: double.infinity,
              width: 180,
              child: CachedNetworkImage(
                imageUrl: entity.image,
                fit: BoxFit.cover,
                errorWidget: (_, __, e) => Image.asset(AppImages.defaultRecipe),
                placeholder: (context, url) =>
                    Image.asset(AppImages.defaultRecipe),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title,
                    style: const TextStyle(fontSize: 17),
                    maxLines: 4,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.time,
                        height: 15,
                      ),
                      Text(
                        '${entity.readyInMinutes} min',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.healthy,
                        height: 15,
                      ),
                      Text(
                        '${entity.healthyScore}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
