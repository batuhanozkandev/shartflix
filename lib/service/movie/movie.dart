import 'package:get/get.dart';
import 'package:shartflix/controller/base/base.dart';
import 'package:shartflix/model/movie/movie.dart';

import '../../controller/server/api/server_controller.dart';
import '../../helper/snack_bar/snack_bar.dart';

class MovieService extends BaseController {
  static Future<List<Movie>?> getMovies({required int page}) async {
    List<Movie> movies = [];
    var response = await ServerController().get('/movie/list?page=$page');
    if (response['response']['code'] == 200) {
      String message = response['response']['message'];
      if (response['data']['movies'] != null) {
        movies = (response['data']['movies'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
      }
      Future.delayed(1.seconds, () {
        AppSnackBar.show(
          statusCode: response['response']['code'] ?? 1001,
          successMessage: message.isEmpty ? 'No Message from Server' : message,
        );
      });

      return movies;
    }
    return [];
  }
}
