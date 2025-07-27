import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/movie/movie.dart';
import '../../service/movie/movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;

  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<ToggleFavoriteMovie>(_onToggleFavoriteMovie);
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

  void _onToggleFavoriteMovie(
    ToggleFavoriteMovie event,
    Emitter<MovieState> emit,
  ) {
    if (state is MovieLoaded) {
      final currentMovies = (state as MovieLoaded).movies;
      final updatedMovies = currentMovies.map((movie) {
        if (movie.id == event.movieId) {
          return Movie(
            sId: movie.sId,
            id: movie.id,
            title: movie.title,
            year: movie.year,
            rated: movie.rated,
            released: movie.released,
            runtime: movie.runtime,
            genre: movie.genre,
            director: movie.director,
            writer: movie.writer,
            actors: movie.actors,
            plot: movie.plot,
            language: movie.language,
            country: movie.country,
            awards: movie.awards,
            poster: movie.poster,
            metascore: movie.metascore,
            imdbRating: movie.imdbRating,
            imdbVotes: movie.imdbVotes,
            imdbID: movie.imdbID,
            type: movie.type,
            response: movie.response,
            images: movie.images,
            comingSoon: movie.comingSoon,
            isFavorite: !(movie.isFavorite ?? false),
          );
        }
        return movie;
      }).toList();

      emit(MovieLoaded(updatedMovies));
    }
  }
}
