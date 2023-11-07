import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tv_show_app/models/movie_list_model/movie_list_model.dart';
import 'package:tv_show_app/models/show_details_model/movie_details_model.dart';
part 'api_sevices.g.dart';

@RestApi(baseUrl: 'https://www.episodate.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET('most-popular')
  Future<MovieListModel> getMoviesList(@Query('page') String page);
  @GET('show-details')
  Future<MovieDetailsModel> getMovie(@Query('q') String q);
}
