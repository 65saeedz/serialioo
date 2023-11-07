import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';

class HorizontalPicListview extends StatelessWidget {
  final TvShow show;
  const HorizontalPicListview({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemCount: show.pictures!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(8),
            width: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.black, size: 20)),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: show.pictures![index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
