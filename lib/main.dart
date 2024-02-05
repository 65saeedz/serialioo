import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_show_app/bloc/movie_detail_bloc/movie_details_bloc.dart';
import 'package:tv_show_app/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:tv_show_app/pages/tv_shows_list.dart';
import 'package:tv_show_app/utils/dependecie_injections.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupGetItDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MovieListBloc(),
          ),
          BlocProvider(
            create: (context) => MovieDetailsBloc(),
          ),
        ],
        child: TvShowsListPage(),
      ),
    );
  }
}
