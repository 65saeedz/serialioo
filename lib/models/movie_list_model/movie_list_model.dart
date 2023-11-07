import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_show.dart';

part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@freezed
class MovieListModel with _$MovieListModel {
  factory MovieListModel({
    String? total,
    int? page,
    int? pages,
    @JsonKey(name: 'tv_shows') List<TvShow>? tvShows,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);
}
