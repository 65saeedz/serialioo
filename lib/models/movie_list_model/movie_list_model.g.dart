// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieListModel _$$_MovieListModelFromJson(Map<String, dynamic> json) =>
    _$_MovieListModel(
      total: json['total'] as String?,
      page: json['page'] as int?,
      pages: json['pages'] as int?,
      tvShows: (json['tv_shows'] as List<dynamic>?)
          ?.map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieListModelToJson(_$_MovieListModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShows,
    };
