import 'package:flutter/material.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/widget/text/body/small.dart';

import '../text/body/medium.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.imageUrl, required this.title, required this.subtitle});

  //'https://via.placeholder.com/150'

  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Card Image
        Container(
          height: 24.h,
          width: 36.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ShartflixRadius.cardRadius),
            color: ColorConstants.buttonBackground,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(ShartflixRadius.cardRadius),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: ShartComponentMediumBody(
                    text: 'Image not available',
                    isBold: true,
                  ),
                );
              },
            ),
          ),
        ),
        1.yh,
        FittedBox(child: ShartComponentMediumBody(text: title, isBold: true)),
        ShartComponentSmallBody(text: subtitle),
      ],
    );
  }
}
