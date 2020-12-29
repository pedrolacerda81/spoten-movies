import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:spoten_movies/home/error_container.dart';
import 'package:spoten_movies/home/movie.dart';
import 'package:spoten_movies/home/movie_card.dart';
import 'package:spoten_movies/home/movie_service.dart';
import 'package:spoten_movies/home/movies_exception.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spoten Movies',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            letterSpacing: 1.5,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: watch(moviesFutureProvider).when(
          data: (movies) {
            return RefreshIndicator(
              onRefresh: () => context.refresh(moviesFutureProvider),
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    MovieCard(movie: movies[index]),
                itemCount: movies.length,
              ),
            );
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          error: (e, s) {
            if (e is MoviesException) {
              return RefreshIndicator(
                onRefresh: () => context.refresh(moviesFutureProvider),
                child: ErrorContainer(
                  message: e.message,
                  onTryAgain: () => context.refresh(moviesFutureProvider),
                ),
              );
            } else {
              debugPrint(e.toString());
              return RefreshIndicator(
                onRefresh: () => context.refresh(moviesFutureProvider),
                child: ErrorContainer(
                  onTryAgain: () => context.refresh(moviesFutureProvider),
                  message: 'Sorry, something went wrong',
                ),
              );
            }
          }),
    );
  }
}
