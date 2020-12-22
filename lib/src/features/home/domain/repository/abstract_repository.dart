import 'package:spoten_movies/src/features/home/domain/models/movie.dart';

abstract class AbstractRepository {
  Future<List<Movie>> getVoteAverageMovies();
}
