// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TvShow _$$_TvShowFromJson(Map<String, dynamic> json) => _$_TvShow(
      id: json['id'] as int?,
      name: json['name'] as String?,
      permalink: json['permalink'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'],
      country: json['country'] as String?,
      network: json['network'] as String?,
      status: json['status'] as String?,
      imageThumbnailPath: json['image_thumbnail_path'] as String?,
    );

Map<String, dynamic> _$$_TvShowToJson(_$_TvShow instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permalink': instance.permalink,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'country': instance.country,
      'network': instance.network,
      'status': instance.status,
      'image_thumbnail_path': instance.imageThumbnailPath,
    };
