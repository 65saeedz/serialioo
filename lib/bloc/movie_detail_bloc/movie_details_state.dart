part of 'movie_details_bloc.dart';

// @freezed
// class MovieDetailsState with _$MovieDetailsState {
//   const factory MovieDetailsState.initial() = _Initial;
// }

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.success(
      {required MovieDetailsModel showDetailsModel}) = _Success;
  const factory MovieDetailsState.failure() = _Failure;
}
