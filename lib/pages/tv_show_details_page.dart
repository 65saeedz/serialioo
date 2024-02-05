import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_show_app/bloc/movie_detail_bloc/movie_details_bloc.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';
import 'package:tv_show_app/widgets/episode_listview.dart';
import 'package:tv_show_app/widgets/genres.dart';
import 'package:tv_show_app/widgets/horizontal_pic_listview.dart';

class TvShowDetailsPage extends StatelessWidget {
  final int showId;
  const TvShowDetailsPage({super.key, required this.showId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieDetailsBloc()..add(MovieDetailsEvent.fetched(tvShowID: showId)),
      child: TvShowDetailsView(),
    );
  }
}

class TvShowDetailsView extends StatelessWidget {
  const TvShowDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('سریالیو'),
          centerTitle: true,
          backgroundColor: Colors.transparent.withOpacity(0.5),
        ),
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
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
              success: (showDetailsModel) => successBody(
                pageWidth: pageWidth,
                pageHeight: pageHeight,
                show: showDetailsModel.tvShow!,
              ),
            );
          },
        ));
  }

  SingleChildScrollView successBody(
      {required pageWidth, required double pageHeight, required TvShow show}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          headerPic(pageHeight, show),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              show.name!,
              overflow: TextOverflow.fade,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(show.genres!.length,
                  (index) => GenreWidget(genre: show.genres![index])),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Text(
              show.description!,
            ),
          ),
          HorizontalPicListview(show: show),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              'Start day :${show.startDate}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.green.shade800, fontSize: 24),
            ),
          ),
          if (show.endDate != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                'End day :${show.endDate}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.green.shade800, fontSize: 24),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              'country :${show.country}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.green.shade800, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              'Rating :${show.rating}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.green.shade800, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              'Network :${show.network}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.green.shade800, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              'Status :${show.status}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.green.shade800, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          EpisodesListView(show: show),
        ],
      ),
    );
  }

  Container headerPic(double pageHeight, TvShow show) {
    return Container(
      alignment: Alignment.center,
      height: pageHeight / 2.2,
      child: CachedNetworkImage(
        imageUrl: show.imagePath!,
        fit: BoxFit.contain,
        placeholder: (context, url) => Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black, size: 40)),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
