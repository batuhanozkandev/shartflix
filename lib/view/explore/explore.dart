import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../bloc/movie_bloc/movie_event.dart';
import '../../bloc/movie_bloc/movie_state.dart';
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
          final threshold = currentPage * 4;

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
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else if (state is MovieLoaded) {
            final movies = state.movies;
            return RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
              onRefresh: () async {
                context.read<MovieBloc>().add(FetchMovies(page: 1));
              },
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ExploreCard(movie: movies[index]);
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
