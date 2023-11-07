import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show.freezed.dart';
part 'tv_show.g.dart';

@freezed
class TvShow with _$TvShow {
  factory TvShow({
    int? id,
    String? name,
    String? permalink,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') dynamic endDate,
    String? country,
    String? network,
    String? status,
    @JsonKey(name: 'image_thumbnail_path') String? imageThumbnailPath,
  }) = _TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);
}
