import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/extention/numX.dart';

import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../bloc/movie_bloc/movie_event.dart';
import '../../bloc/movie_bloc/movie_state.dart';
import '../../widget/button/back_button.dart';
import '../../widget/explore/explore_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieBloc>().add(FetchMovies(page: 1));

      _pageController.addListener(() {
        final bloc = context.read<MovieBloc>();
        final currentPage = bloc.currentPage;

        if (_pageController.hasClients && _pageController.page != null) {
          final threshold = currentPage * 10 - 3;

          if (_pageController.page!.toInt() >= threshold) {
            bloc.add(FetchMovies(page: currentPage + 1));
          }
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading && state is! MovieLoaded) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else if (state is MovieLoaded) {
            final movies = state.movies;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ExploreCard(
                  imageUrl: movies[index].images?[0] ??
                            'https://via.placeholder.com/150',
                  title: movie.title ?? 'No Title',
                  subtitle: movie.director ?? '',
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
