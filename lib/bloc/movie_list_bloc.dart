import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_show_app/models/movie_list_model/movie_list_model.dart';
import 'package:tv_show_app/models/movie_list_model/tv_show.dart';
import 'package:tv_show_app/services/api_sevices.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';
part 'movie_list_bloc.freezed.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(const _Initial()) {
    on<_MoviesFetched>(_moviesFetched);
  }

  // final dio = Dio();
  final api = ApiService(Dio());

  FutureOr<void> _moviesFetched(
      MovieListEvent event, Emitter<MovieListState> emit) async {
    emit(const MovieListState.loading());
    try {
      final response = await api.getMoviesList(event.page.toString());
      emit(MovieListState.success(movieListModel: response));
      // log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
