abstract class MovieEvent {}

class FetchMovies extends MovieEvent {
  final int page;

  FetchMovies({required this.page});
}

class FetchFavoriteMovies extends MovieEvent {
  FetchFavoriteMovies();
}

class ToggleFavoriteMovie extends MovieEvent {
  final String movieId;

  ToggleFavoriteMovie(this.movieId);
}
