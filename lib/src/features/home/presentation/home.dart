import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/src/features/home/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/src/features/home/bloc/upcoming_movies/bloc/upcoming_movies_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/movie_card.dart';
import '../../../widgets/movie_list_title.dart';
import '../bloc/playing_movies/playing_movies_bloc.dart';
import '../bloc/top_rated/bloc/top_rated_movies_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlayingMoviesBloc>().add(PlayingMoviesFetched());
    context.read<PopularMoviesBloc>().add(PopularMoviesFetched());
    context.read<TopRatedMoviesBloc>().add(TopRatedMoviesFetched());
    context.read<UpcomingMoviesBloc>().add(UpcomingMoviesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).welcome,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  "/settings",
                );
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieListTitle(title: AppLocalizations.of(context).topRated),
              topRatedMovies(),
              MovieListTitle(title: AppLocalizations.of(context).playingNow),
              playingNowMovies(),
              MovieListTitle(title: AppLocalizations.of(context).upcoming),
              upcomingMovies(),
              MovieListTitle(title: AppLocalizations.of(context).popular),
              popularMovies(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<PlayingMoviesBloc, PlayingMoviesState> playingNowMovies() {
    return BlocBuilder<PlayingMoviesBloc, PlayingMoviesState>(
        builder: (context, state) {
      if (state is PlayingMoviesFailure) {
        return Text('Error : ${state.error}');
      } else if (state is! PlayigMoviesSuccess) {
        return Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                ],
              )),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.playingNowModel.results!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed("moviedetailscreen", pathParameters: {
                    'backDropPath': state
                        .playingNowModel.results![index].backdropPath
                        .toString(),
                    'overview': state.playingNowModel.results![index].overview
                        .toString(),
                    'posterPath': state
                        .playingNowModel.results![index].posterPath
                        .toString(),
                    'releaseDate': DateFormat('dd MMM yyyy').format(
                      DateTime.parse(state
                          .playingNowModel.results![index].releaseDate
                          .toString()),
                    ),
                    'title':
                        state.playingNowModel.results![index].title.toString(),
                    'language': state
                        .playingNowModel.results![index].originalLanguage
                        .toString()
                  });
                },
                child: MovieCard(
                  title: state.playingNowModel.results![index].title.toString(),
                  releaseDate: state.playingNowModel.results![index].releaseDate
                      .toString(),
                  popularity: state.playingNowModel.results![index].popularity
                      .toString(),
                  posterPath: state.playingNowModel.results![index].posterPath
                      .toString(),
                ),
              );
            }),
          ),
        ),
      );
    });
  }

  BlocBuilder<PopularMoviesBloc, PopularMoviesState> popularMovies() {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
      if (state is PopularMoviesFailure) {
        return Text('Error : ${state.error}');
      } else if (state is! PopularMoviesSuccess) {
        return Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                ],
              )),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.popularMoviesModel.results!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed("moviedetailscreen", pathParameters: {
                    'backDropPath': state
                        .popularMoviesModel.results![index].backdropPath
                        .toString(),
                    'overview': state
                        .popularMoviesModel.results![index].overview
                        .toString(),
                    'posterPath': state
                        .popularMoviesModel.results![index].posterPath
                        .toString(),
                    'releaseDate': DateFormat('dd MMM yyyy').format(
                      DateTime.parse(state
                          .popularMoviesModel.results![index].releaseDate
                          .toString()),
                    ),
                    'title': state.popularMoviesModel.results![index].title
                        .toString(),
                    'language': state
                        .popularMoviesModel.results![index].originalLanguage
                        .toString()
                  });
                },
                child: MovieCard(
                  title:
                      state.popularMoviesModel.results![index].title.toString(),
                  releaseDate: state
                      .popularMoviesModel.results![index].releaseDate
                      .toString(),
                  popularity: state
                      .popularMoviesModel.results![index].popularity
                      .toString(),
                  posterPath: state
                      .popularMoviesModel.results![index].posterPath
                      .toString(),
                ),
              );
            }),
          ),
        ),
      );
    });
  }

  BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState> topRatedMovies() {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (context, state) {
      if (state is TopRatedMoviesFailure) {
        return Text('Error : ${state.error}');
      } else if (state is! TopRatedMoviesSuccess) {
        return Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                ],
              )),
        );
      }
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: state.topRatedMoviesModel.results!.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                GoRouter.of(context)
                    .pushNamed("moviedetailscreen", pathParameters: {
                  'backDropPath': state
                      .topRatedMoviesModel.results![index].backdropPath
                      .toString(),
                  'overview': state.topRatedMoviesModel.results![index].overview
                      .toString(),
                  'posterPath': state
                      .topRatedMoviesModel.results![index].posterPath
                      .toString(),
                  'releaseDate': DateFormat('dd MMM yyyy').format(
                    DateTime.parse(state
                        .topRatedMoviesModel.results![index].releaseDate
                        .toString()),
                  ),
                  'title': state.topRatedMoviesModel.results![index].title
                      .toString(),
                  'language': state
                      .topRatedMoviesModel.results![index].originalLanguage
                      .toString()
                });
              },
              child: MovieCard(
                title:
                    state.topRatedMoviesModel.results![index].title.toString(),
                releaseDate: state
                    .topRatedMoviesModel.results![index].releaseDate
                    .toString(),
                popularity: state.topRatedMoviesModel.results![index].popularity
                    .toString(),
                posterPath: state.topRatedMoviesModel.results![index].posterPath
                    .toString(),
              ),
            );
          }),
        ),
      );
    });
  }

  BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState> upcomingMovies() {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
      if (state is UpcomingMoviesFailure) {
        return Text('Error : ${state.error}');
      } else if (state is! UpcomingMoviesSuccess) {
        return Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                ],
              )),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.upcomingMovies.results!.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed("moviedetailscreen", pathParameters: {
                    'backDropPath': state
                        .upcomingMovies.results![index].backdropPath
                        .toString(),
                    'overview': state.upcomingMovies.results![index].overview
                        .toString(),
                    'posterPath': state
                        .upcomingMovies.results![index].posterPath
                        .toString(),
                    'releaseDate': DateFormat('dd MMM yyyy').format(
                      DateTime.parse(state
                          .upcomingMovies.results![index].releaseDate
                          .toString()),
                    ),
                    'title':
                        state.upcomingMovies.results![index].title.toString(),
                    'language': state
                        .upcomingMovies.results![index].originalLanguage
                        .toString()
                  });
                },
                child: MovieCard(
                  title: state.upcomingMovies.results![index].title.toString(),
                  releaseDate: state.upcomingMovies.results![index].releaseDate
                      .toString(),
                  popularity: state.upcomingMovies.results![index].popularity
                      .toString(),
                  posterPath: state.upcomingMovies.results![index].posterPath
                      .toString(),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
