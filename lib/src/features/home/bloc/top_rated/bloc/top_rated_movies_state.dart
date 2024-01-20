part of 'top_rated_movies_bloc.dart';

@immutable
class TopRatedMoviesState {}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final TopRatedMovies topRatedMoviesModel;

  TopRatedMoviesSuccess(this.topRatedMoviesModel);
}

class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String error;

  TopRatedMoviesFailure(this.error);
}
