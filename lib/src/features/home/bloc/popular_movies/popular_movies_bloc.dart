import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/data/data_repository.dart';

import '../../models/popular_movies_model.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  DataRepositoryHome dataRepositoryHome;
  PopularMoviesBloc(this.dataRepositoryHome) : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>(_OnPopularMoviesEvent);
  }

  void _OnPopularMoviesEvent(
      PopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMoviesLoading());
    try {
      final popularMovies = await dataRepositoryHome.getPopularMovies();
      emit(PopularMoviesSuccess(popularMovies));
    } catch (e) {
      emit(PopularMoviesFailure(e.toString()));
    }
  }
}
