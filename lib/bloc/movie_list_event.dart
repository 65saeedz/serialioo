part of 'movie_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  const factory MovieListEvent.moviesFetched({required int page}) =
      _MoviesFetched;
}
