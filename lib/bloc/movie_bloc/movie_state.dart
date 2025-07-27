import '../../model/movie/movie.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies);
}

class FavoriteInitial extends MovieState {}

class FavoriteMovieLoading extends MovieState {}

class FavoriteMovieLoaded extends MovieState {
  final List<Movie> favoriteMovies;

  FavoriteMovieLoaded(this.favoriteMovies);
}
class FavoriteMovieError extends MovieState {
  final String message;

  FavoriteMovieError(this.message);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
