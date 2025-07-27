import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/model/movie/movie.dart';
import 'package:shartflix/widget/button/follow_button.dart';
import 'package:shartflix/widget/text/body/large.dart';

import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../bloc/movie_bloc/movie_event.dart';
import '../../bloc/movie_bloc/movie_state.dart';
import '../../core/constant/color.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Positioned.fill(
            child:
                movie?.images != null &&
                    movie?.images?[0] != null &&
                    movie!.images![0].isNotEmpty
                ? Image.network(movie!.images![0], fit: BoxFit.cover)
                : Image.asset(
                    'assets/images/img_splash_sinflix.png',
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorConstants.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 8.w,
            child: SizedBox(
              width: 84.w,
              child: Column(
                children: [
                  BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoaded) {
                        final targetMovie = state.movies.firstWhere(
                          (m) => m.id == movie?.id,
                        );

                        final isFav = targetMovie.isFavorite ?? false;

                        return Align(
                          alignment: Alignment.centerRight,
                          child: ShartComponentFollowButton(
                            key: ValueKey(isFav),
                            onTap: () => context.read<MovieBloc>().add(
                              ToggleFavoriteMovie(targetMovie.id ?? ''),
                            ),
                            isLiked: isFav,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: 5.h,
                        child: movie != null && movie!.images?[1] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  movie!.images![1],
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  'assets/images/img_logo_sinflix.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      2.xw,
                      SizedBox(
                        width: 52.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (movie?.title != null)
                              ShartComponentLargeBody(
                                text: movie!.title!,
                                isBold: true,
                                maxLines: 1,
                              ),
                            if (movie?.title != null)
                              RichText(
                                text: TextSpan(
                                  text: movie!.writer!,
                                  style: Get.theme.textTheme.bodySmall!
                                      .copyWith(color: ColorConstants.darkText),
                                  children: [
                                    TextSpan(
                                      text: ' Daha Fazlası',
                                      style: Get.theme.textTheme.bodySmall!
                                          .copyWith(
                                            color:
                                                Get.theme.colorScheme.secondary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
