import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_show_app/models/movie_list_model/tv_show.dart';
import 'package:tv_show_app/widgets/tv_show_card.dart';

class InfinitGridView extends StatelessWidget {
  const InfinitGridView({
    super.key,
    required ScrollController controller,
    required this.tvList,
    required this.hasReachedMax,
  }) : _controller = controller;

  final ScrollController _controller;
  final List<TvShow> tvList;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 350,
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
        },
      ),
    );
  }
}
