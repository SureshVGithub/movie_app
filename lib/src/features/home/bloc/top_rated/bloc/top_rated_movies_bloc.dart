import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_repository.dart';
import '../../../models/top_rated_movies_model.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  DataRepositoryHome dataRepositoryHome;

  TopRatedMoviesBloc(this.dataRepositoryHome) : super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesEvent>(_OnTopRatedMoviesEvent);
  }

  void _OnTopRatedMoviesEvent(
      TopRatedMoviesEvent event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMoviesLoading());
    try {
      final topRatedMovies = await dataRepositoryHome.getTopRatedMovies();
      emit(TopRatedMoviesSuccess(topRatedMovies));
    } catch (e) {
      emit(TopRatedMoviesFailure(e.toString()));
    }
  }
}
