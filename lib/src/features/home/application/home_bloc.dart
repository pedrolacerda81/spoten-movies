import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:spoten_movies/src/features/home/data/repository.dart';
import 'package:spoten_movies/src/features/home/domain/home_failure.dart';
import 'package:spoten_movies/src/features/home/domain/movie.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _homeRepository;

  HomeBloc(this._homeRepository) : super(const HomeState.initial());

  StreamSubscription<Either<HomeFailure, KtList<Movie>>>
      _noteStreamSubscription;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.map(loadMoviesData: (e) async* {});
  }
}
