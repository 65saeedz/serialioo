import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_show_app/models/movie_list_model/tv_show.dart';
import 'package:tv_show_app/services/api_sevices.dart';
import 'package:tv_show_app/utils/dependecie_injections.dart';

part 'movie_list_bloc.freezed.dart';
part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(_Initial()) {
    on<_MoviesFetched>(_moviesFetched);
  }
  final api = dependencyLocator.get<ApiService>();
  int page = 1;

  FutureOr<void> _moviesFetched(
      MovieListEvent event, Emitter<MovieListState> emit) async {
    final hasReachedMax = state.when(
      success: (movieListModel, hasReachMax) => hasReachMax,
      loading: () => false,
      initial: () => false,
      failure: () => false,
    );
    if (hasReachedMax) return;

    try {
      if (state is _Initial) {
        emit(const MovieListState.loading());
        final moviesList = await api.getMoviesList(page.toString());
        print(moviesList);
        emit(MovieListState.success(movieListModel: moviesList.tvShows ?? []));
      }
      page++;
      final moviesList = await api.getMoviesList(page.toString());
      final castedState = state as _Success;
      page == moviesList.pages
          ? emit(castedState.copyWith(hasReachMax: true))
          : emit(
              castedState.copyWith(
                  movieListModel: List.of(castedState.movieListModel)
                    ..addAll(moviesList.tvShows ?? []),
                  hasReachMax: false),
            );
    } catch (e) {
      emit(MovieListState.failure());
    }
  }
}
