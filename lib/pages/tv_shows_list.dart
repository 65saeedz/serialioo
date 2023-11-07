import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_show_app/bloc/movie_list_bloc.dart';
import 'package:tv_show_app/models/movie_list_model/tv_show.dart';
import 'package:tv_show_app/widgets/tv_show_card.dart';

class TvShowsListPage extends StatefulWidget {
  const TvShowsListPage({super.key});

  @override
  State<TvShowsListPage> createState() => _TvShowsListPageState();
}

class _TvShowsListPageState extends State<TvShowsListPage> {
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    getTheList();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        context.read<MovieListBloc>().add(MovieListEvent.moviesFetched());
      }
    });
  }

  getTheList() {
    context.read<MovieListBloc>()..add(MovieListEvent.moviesFetched());
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
              return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.black, size: 50));
            },
            failure: () {
              return Center(
                  child: Container(
                height: 100,
                width: 250,
                child: Text('error'),
              ));
            },
            success: (movieListModel, hasReachMax) {
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
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            'سریالیو',
                            style: TextStyle(fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 7,
                    child: grid(
                      movieListModel,
                      hasReachMax,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Center grid(List<TvShow> tvList, bool hasReachedMax) {
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
        controller: _controller,
        itemCount: tvList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < tvList.length) {
            return TvShowCard(tvShow: tvList[index]);
          } else {
            return SizedBox(
              height: 24,
              width: 24,
              child: hasReachedMax
                  ? const Center(
                      child: Text('End of List'),
                    )
                  : Center(
                      child: Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.black, size: 50)),
                    ),
            );
          }
          // return TvShowCard(
          //   tvShow: tvList[index],
          // );
        },
      ),
    );
  }
}
