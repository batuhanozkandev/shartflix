abstract class MovieEvent {}

class FetchMovies extends MovieEvent {
  final int page;

  FetchMovies({required this.page});
}

class ToggleFavoriteMovie extends MovieEvent {
  final String movieId;

  ToggleFavoriteMovie(this.movieId);
}