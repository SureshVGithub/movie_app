import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/data/data_repository.dart';
import 'package:movie_app/src/features/home/models/playing_now_model.dart';

part 'playing_movies_event.dart';
part 'playing_movies_state.dart';

class PlayingMoviesBloc extends Bloc<PlayingMoviesEvent, PlayingMoviesState> {
  final DataRepositoryHome dataRepositoryHome;
  PlayingMoviesBloc(this.dataRepositoryHome) : super(PlayinMoviesInitial()) {
    on<PlayingMoviesEvent>(_onPlayingMoviesEvent);
  }
  _onPlayingMoviesEvent(
      PlayingMoviesEvent event, Emitter<PlayingMoviesState> emit) async {
    emit(PlayingMoviesLoading());
    try {
      final playingMovies = await dataRepositoryHome.getPlayingMovies();
      // print('playingMovies ${playingMovies.toJson()}');
      emit(PlayigMoviesSuccess(playingMovies));
    } catch (e) {
      emit(PlayingMoviesFailure(e.toString()));
    }
  }
}
