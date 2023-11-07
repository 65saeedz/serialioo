import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show_app/bloc/movie_detail_bloc/movie_details_bloc.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';

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
    return Scaffold(body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
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
            width: pageWidth,
            // height: pageHeight / 2.2,
            child: Image.network(
              show.imagePath!,
              fit: BoxFit.fitHeight,
              width: pageWidth,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                show.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
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
                  (index) => genreComponent(show.genres![index])),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Text(
              show.description!,
            ),
          ),
          SizedBox(
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
                    child: Image.network(
                      fit: BoxFit.cover,
                      show.pictures![index],
                      width: pageWidth,
                    ),
                  ),
                );
              },
            ),
          ),
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
          ListView.separated(
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
                  style: TextStyle(color: Colors.green.shade800, fontSize: 24),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container genreComponent(String genre) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Text(genre),
    );
  }
}
