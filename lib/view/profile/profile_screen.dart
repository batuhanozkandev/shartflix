import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/routes/routes.dart';
import 'package:shartflix/widget/app_bar/app_bar.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/text/body/medium.dart';
import 'package:shartflix/widget/text/body/small.dart';

import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../bloc/movie_bloc/movie_state.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';
import '../../widget/card/movie.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: ColorConstants.background,
      extendBody: true,
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else if (state is UserLoaded) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    ShartAppBar(
                      isActiveLimitedOfferButton: true,
                      hasBackButton: false,
                    ),
                    4.yh,
                    SizedBox(
                      width: 92.w,
                      child: Row(
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CupertinoColors.systemGrey,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.w),
                              child:
                                  state.user.photoUrl != null &&
                                      state.user.photoUrl!.isNotEmpty
                                  ? Image.network(
                                      state.user.photoUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/img_logo_sinflix.png',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          4.xw,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShartComponentMediumBody(text: 'Batuhan Özkan'),
                              1.yh,
                              ShartComponentSmallBody(
                                text:
                                    'ID: ${state.user.id.toString().substring(0, 6)}',
                                isDark: true,
                              ),
                            ],
                          ),
                          Spacer(),
                          ShartComponentPrimaryButton(
                            height: 4.h,
                            width: 28.w,
                            text: 'Fotoğraf Ekle',
                            onTap: () =>
                                Get.toNamed(AppPages.addProfilePhotoScreen),
                          ),
                        ],
                      ),
                    ),
                    4.yh,
                    Padding(
                      padding: 8.w.pLeft,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ShartComponentMediumBody(
                          text: 'Beğendiğim filmler',
                          isBold: true,
                        ),
                      ),
                    ),
                    2.yh,
                    BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is FavoriteMovieLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is FavoriteMovieError) {
                          return Center(child: Text(state.message));
                        } else if (state is FavoriteMovieLoaded) {
                          return GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            itemCount: state.favoriteMovies.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.w,
                                  crossAxisSpacing: 4.w,
                                  childAspectRatio: 0.65,
                                ),
                            itemBuilder: (_, index) {
                              return MovieCard(
                                imageUrl:
                                    (state.favoriteMovies[index].images?[0] ??
                                    state.favoriteMovies[index].poster ??
                                    'https://via.placeholder.com/150'),
                                title:
                                    state.favoriteMovies[index].title ??
                                    'Movie Title',
                                subtitle:
                                    state.favoriteMovies[index].director ??
                                    'Director',
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
