part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsEvent with _$MovieDetailsEvent {
  const factory MovieDetailsEvent.fetched({required int tvShowID}) = _MovieFetched;
}