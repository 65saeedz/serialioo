import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show_app/bloc/movie_list_bloc.dart';
import 'package:tv_show_app/models/movie_list_model/tv_show.dart';
import 'package:tv_show_app/widgets/tv_show_card.dart';

class TvShowsListPage extends StatefulWidget {
  const TvShowsListPage({super.key});

  @override
  State<TvShowsListPage> createState() => _TvShowsListPageState();
}

class _TvShowsListPageState extends State<TvShowsListPage> {
  int currentPage = 1;
  @override
  void initState() {
    getTheList(page: currentPage);
    super.initState();
  }

  getTheList({required int page}) {
    context.read<MovieListBloc>()
      ..add(MovieListEvent.moviesFetched(page: page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return Center(
                  child: Container(
                height: 100,
                width: 250,
                child: Text('initial'),
              ));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            failure: () {
              return Center(
                  child: Container(
                height: 100,
                width: 250,
                child: Text('error'),
              ));
            },
            success: (movieListModel) {
              return Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 110,
                      decoration:
                          BoxDecoration(color: Colors.purple.withOpacity(0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'سریالیو',
                            style: TextStyle(fontSize: 28),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: movieListModel.page! > 1
                                        ? () {
                                            getTheList(page: 1);
                                          }
                                        : null,
                                    icon: Icon(
                                      Icons.keyboard_double_arrow_left_rounded,
                                      size: 22,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: movieListModel.page! > 1
                                        ? () {
                                            getTheList(
                                                page: movieListModel.page! - 1);
                                          }
                                        : null,
                                    icon: Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                      size: 22,
                                    ),
                                  ),
                                  Text('${movieListModel.page} صفحه '),
                                  IconButton(
                                    onPressed: movieListModel.page! >=
                                            movieListModel.pages!
                                        ? null
                                        : () {
                                            getTheList(
                                                page: movieListModel.page! + 1);
                                          },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 22,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: movieListModel.page! >=
                                            movieListModel.pages!
                                        ? null
                                        : () {
                                            getTheList(
                                                page: movieListModel.pages!);
                                          },
                                    icon: Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(flex: 7, child: grid(movieListModel.tvShows ?? [])),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Center grid(List<TvShow> tvList) {
    return Center(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 350,
          // childAspectRatio: 1 / 2,
        ),
        itemCount: tvList.length,
        itemBuilder: (BuildContext context, int index) {
          return TvShowCard(
            tvShow: tvList[index],
          );
        },
      ),
    );
  }
}
