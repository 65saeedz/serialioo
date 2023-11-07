import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_show_app/pages/tv_show_details_page.dart';

import '../models/movie_list_model/tv_show.dart';

class TvShowCard extends StatelessWidget {
  final TvShow tvShow;
  const TvShowCard({
    super.key,
    required this.tvShow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.11),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          print('${tvShow.id}');
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TvShowDetailsPage(showId: tvShow.id ?? 23455),
          ));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: tvShow.imageThumbnailPath!,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: (context, url) => Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.black, size: 20)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                tvShow.name!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'Start day :${tvShow.startDate}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.green.shade800, fontSize: 12),
              ),
            ),
            if (tvShow.endDate != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text(
                  'End day :${tvShow.endDate}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.green.shade800, fontSize: 12),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'country :${tvShow.country}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.green.shade800, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'Network :${tvShow.network}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.green.shade800, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'Status :${tvShow.status}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.green.shade800, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
