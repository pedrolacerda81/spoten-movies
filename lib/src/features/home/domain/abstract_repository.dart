import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:spoten_movies/src/features/home/domain/home_failure.dart';
import 'package:spoten_movies/src/features/home/domain/movie.dart';

abstract class AbstractRepository {
  Stream<Either<HomeFailure, KtList<Movie>>> watchAllVoteAverageMovies();
  Stream<Either<HomeFailure, Movie>> show();
}
