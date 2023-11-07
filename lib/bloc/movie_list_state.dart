part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading() = _Loading;
  const factory MovieListState.success({
    required List<TvShow> movieListModel,
    @Default(false) bool hasReachMax,
  }) = _Success;
  const factory MovieListState.failure() = _Failure;
}
