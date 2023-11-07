import 'package:flutter/material.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';

class EpisodesListView extends StatelessWidget {
  final TvShow show;
  const EpisodesListView({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: show.episodes!.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(
            'Episode :${show.episodes![index].season}/${show.episodes![index].episode} : ${show.episodes![index].name}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45, fontSize: 24),
          ),
        );
      },
    );
  }
}
