part of 'upcoming_movies_bloc.dart';

@immutable
 class UpcomingMoviesState {}

 class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final UpcomingMovies upcomingMovies;

  UpcomingMoviesSuccess(this.upcomingMovies);
}

class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String error;

  UpcomingMoviesFailure(this.error);
}
