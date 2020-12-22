import 'package:kt_dart/kt.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:spoten_movies/src/core/data/datasource.dart';
import 'package:spoten_movies/src/features/home/domain/movie.dart';
import 'package:spoten_movies/src/core/config/enviroment_config.dart';
import 'package:spoten_movies/src/features/home/domain/home_failure.dart';
import 'package:spoten_movies/src/features/home/domain/abstract_repository.dart';

class Repository implements AbstractRepository {
  final EnviromentConfig enviromentConfig;
  final DataSource datasource;

  Repository({@required this.enviromentConfig, @required this.datasource});

  // @override
  // Future<List<Movie>> getVoteAverageMovies() async {
  //   try {
  //     final response = await datasource.dio.get(
  //         '/3/discover/movie?api_key=${enviromentConfig.movieApiKey}&primary_release_year=${DateTime.now().year}&sort_by=vote_average.desc');
  //     debugPrint(
  //         'https://api.themoviedb.org/3/discover/movie?api_key=${enviromentConfig.movieApiKey}&primary_release_year=${DateTime.now().year}&sort_by=vote_average.desc');
  //     final results = List<Map<String, dynamic>>.from(response.data['results']);
  //     debugPrint('results ${results.toString()}');
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  @override
  Stream<Either<HomeFailure, KtList<Movie>>> watchAllVoteAverageMovies() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }

  @override
  Stream<Either<HomeFailure, Movie>> show() {
    // TODO: implement show
    throw UnimplementedError();
  }
}
