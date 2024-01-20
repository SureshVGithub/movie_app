part of 'playing_movies_bloc.dart';

@immutable
class PlayingMoviesState {}

class PlayinMoviesInitial extends PlayingMoviesState {}

class PlayingMoviesLoading extends PlayingMoviesState {}

class PlayigMoviesSuccess extends PlayingMoviesState {
  final PlayingNowModel playingNowModel;

  PlayigMoviesSuccess(this.playingNowModel);

}

class PlayingMoviesFailure extends PlayingMoviesState {
  final String error;

  PlayingMoviesFailure(this.error);
}
