// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) {
  return _MovieListModel.fromJson(json);
}

/// @nodoc
mixin _$MovieListModel {
  String? get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'tv_shows')
  List<TvShow>? get tvShows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListModelCopyWith<MovieListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListModelCopyWith<$Res> {
  factory $MovieListModelCopyWith(
          MovieListModel value, $Res Function(MovieListModel) then) =
      _$MovieListModelCopyWithImpl<$Res, MovieListModel>;
  @useResult
  $Res call(
      {String? total,
      int? page,
      int? pages,
      @JsonKey(name: 'tv_shows') List<TvShow>? tvShows});
}

/// @nodoc
class _$MovieListModelCopyWithImpl<$Res, $Val extends MovieListModel>
    implements $MovieListModelCopyWith<$Res> {
  _$MovieListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? tvShows = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      tvShows: freezed == tvShows
          ? _value.tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TvShow>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieListModelCopyWith<$Res>
    implements $MovieListModelCopyWith<$Res> {
  factory _$$_MovieListModelCopyWith(
          _$_MovieListModel value, $Res Function(_$_MovieListModel) then) =
      __$$_MovieListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? total,
      int? page,
      int? pages,
      @JsonKey(name: 'tv_shows') List<TvShow>? tvShows});
}

/// @nodoc
class __$$_MovieListModelCopyWithImpl<$Res>
    extends _$MovieListModelCopyWithImpl<$Res, _$_MovieListModel>
    implements _$$_MovieListModelCopyWith<$Res> {
  __$$_MovieListModelCopyWithImpl(
      _$_MovieListModel _value, $Res Function(_$_MovieListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? tvShows = freezed,
  }) {
    return _then(_$_MovieListModel(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      tvShows: freezed == tvShows
          ? _value._tvShows
          : tvShows // ignore: cast_nullable_to_non_nullable
              as List<TvShow>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieListModel implements _MovieListModel {
  _$_MovieListModel(
      {this.total,
      this.page,
      this.pages,
      @JsonKey(name: 'tv_shows') final List<TvShow>? tvShows})
      : _tvShows = tvShows;

  factory _$_MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$$_MovieListModelFromJson(json);

  @override
  final String? total;
  @override
  final int? page;
  @override
  final int? pages;
  final List<TvShow>? _tvShows;
  @override
  @JsonKey(name: 'tv_shows')
  List<TvShow>? get tvShows {
    final value = _tvShows;
    if (value == null) return null;
    if (_tvShows is EqualUnmodifiableListView) return _tvShows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieListModel(total: $total, page: $page, pages: $pages, tvShows: $tvShows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other._tvShows, _tvShows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_tvShows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieListModelCopyWith<_$_MovieListModel> get copyWith =>
      __$$_MovieListModelCopyWithImpl<_$_MovieListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieListModelToJson(
      this,
    );
  }
}

abstract class _MovieListModel implements MovieListModel {
  factory _MovieListModel(
          {final String? total,
          final int? page,
          final int? pages,
          @JsonKey(name: 'tv_shows') final List<TvShow>? tvShows}) =
      _$_MovieListModel;

  factory _MovieListModel.fromJson(Map<String, dynamic> json) =
      _$_MovieListModel.fromJson;

  @override
  String? get total;
  @override
  int? get page;
  @override
  int? get pages;
  @override
  @JsonKey(name: 'tv_shows')
  List<TvShow>? get tvShows;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListModelCopyWith<_$_MovieListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
