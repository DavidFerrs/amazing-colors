import 'package:amazing_colors/app/core/extensions/color_converter_extension.dart';
import 'package:amazing_colors/app/core/styles/app_colors.dart';
import 'package:amazing_colors/app/core/styles/app_text_style.dart';
import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:flutter/material.dart';

/// A tile widget to show the colors on a history list
class ColorTileComponent extends StatelessWidget {

  /// Creates a [ColorTileComponent]
  const ColorTileComponent({
    required this.isBright,
    required this.colorEntity,
    super.key,
  });

  /// The data to represent the color and the status
  final ColorEntity colorEntity;
  // TODO(DavidFerrs): remove this
  ///
  final bool isBright;

  @override
  Widget build(BuildContext context) {
    const Color lightTextColor = AppColors.plainWhite;
    const Color blackTextColor = AppColors.plainBlack;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: colorEntity.hex.toColor,
          radius: 16,
        ),

        Text(
          colorEntity.hex,
          style: AppTextStyle.montserratRegular.copyWith(
            fontSize: 20,
            color: isBright ? blackTextColor : lightTextColor,
          ),
        ),

        Icon(
          Icons.star_sharp,
          color: colorEntity.isFavorite
              ? AppColors.favoritedStarColor
              : AppColors.plainWhite,
              
        ),
      ],
    );
  }
}
