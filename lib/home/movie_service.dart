import 'package:dio/dio.dart';
import 'package:spoten_movies/home/movie.dart';
import 'package:spoten_movies/enviroment_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoten_movies/home/movies_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(enviromentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  final EnviromentConfig enviromentConfig;
  final Dio dio;

  MovieService(this.enviromentConfig, this.dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/discover/movie?api_key=${enviromentConfig.movieApiKey}&primary_release_year=2020&sort_by=vote_average.desc');

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);

      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
