import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/movie/movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;

  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<FetchFavoriteMovies>(_onFetchFavoriteMovies);
    on<ToggleFavoriteMovie>((event, emit) async {
      final currentState = state;

      if (currentState is MovieLoaded) {
        print('Toggling favorite for movie ID: ${event.movieId}');
        final updatedMovies = currentState.movies.map((movie) {
          if (movie.id == event.movieId) {
            return movie.copyWith(isFavorite: !(movie.isFavorite ?? false));
          }
          return movie;
        }).toList();

        try {
          MovieLoading();
          await MovieService.favoriteMovie(movieID: event.movieId)
              .then((_) {
                emit(MovieLoaded(updatedMovies));
              })
              .catchError((error) {
                print('Error toggling favorite: $error');
              });
          print('Emit updated state with toggled favorite movie');
        } catch (e) {
          emit(MovieError('Error toggling favorite: $e'));
        }
      }
    });
  }

  Future<void> _onFetchMovies(
    FetchMovies event,
    Emitter<MovieState> emit,
  ) async {
    if (isFetching) return;
    if (currentPage == 4) {
      hasReachedMax = true;
      return;
    }

    isFetching = true;

    try {
      if (state is MovieLoaded && event.page > 1) {
        final oldMovies = (state as MovieLoaded).movies;
        final newMovies = await MovieService.getMovies(page: event.page);
        final allMovies = [...oldMovies, ...?newMovies];
        emit(MovieLoaded(allMovies));
      } else {
        emit(MovieLoading());
        final movies = await MovieService.getMovies(page: event.page);
        if (movies == null || movies.isEmpty) {
          emit(MovieError('No movies found'));
          return;
        }
        emit(MovieLoaded(movies));
      }
      currentPage = event.page;
    } catch (e) {
      emit(MovieError('Error fetching movies: $e'));
    } finally {
      isFetching = false;
    }
  }

  Future<void> _onFetchFavoriteMovies(
    FetchFavoriteMovies event,
    Emitter<MovieState> emit,
  ) async {
    if (isFetching) return;

    isFetching = true;

    try {
      if (state is FavoriteMovieLoaded) {
        final favoriteMovies = await MovieService.getFavoriteMovies();
        if (favoriteMovies == null || favoriteMovies.isEmpty) {
          emit(FavoriteMovieError('No favorite movies found'));
          return;
        }
        emit(FavoriteMovieLoaded(favoriteMovies));
      } else {
        emit(FavoriteMovieLoading());
        final movies = await MovieService.getFavoriteMovies();
        if (movies == null || movies.isEmpty) {
          emit(FavoriteMovieError('No movies found'));
          return;
        }
        emit(FavoriteMovieLoaded(movies));
      }
    } catch (e) {
      emit(MovieError('Error fetching movies: $e'));
    } finally {
      isFetching = false;
    }
  }
}
