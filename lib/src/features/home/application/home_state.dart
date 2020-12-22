part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadInProgress() = _LoadInProgress;
  const factory HomeState.loadSuccess(KtList<Movie> home) = _LoadSuccess;
  const factory HomeState.loadFailure(HomeFailure homeFailure) = _LoadFailure;
}
