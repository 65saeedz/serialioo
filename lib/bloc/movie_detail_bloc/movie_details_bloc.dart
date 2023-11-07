import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';
import 'package:tv_show_app/services/api_sevices.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
part 'movie_details_bloc.freezed.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(_Initial()) {
    on<_MovieFetched>(_movieFetched);
  }
  final api = ApiService(Dio());

  FutureOr<void> _movieFetched(
      _MovieFetched event, Emitter<MovieDetailsState> emit) async {
    emit(const MovieDetailsState.loading());
    try {
      final response = await api.getMovie(event.tvShowID.toString());
      log(response.toString());
      //  await Future.delayed(Duration(seconds: 4));
      emit(MovieDetailsState.success(showDetailsModel: response));
    } catch (e) {
      log(e.toString());
    }
  }
}
