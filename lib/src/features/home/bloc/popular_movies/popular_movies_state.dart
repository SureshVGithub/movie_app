part of 'popular_movies_bloc.dart';

@immutable
class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final PopularMoviesModel popularMoviesModel;

  PopularMoviesSuccess(this.popularMoviesModel);


}

class PopularMoviesFailure extends PopularMoviesState {
  final String error;

  PopularMoviesFailure(this.error);
}
