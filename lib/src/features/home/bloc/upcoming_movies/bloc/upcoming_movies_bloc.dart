import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/src/features/home/data/data_repository.dart';

import '../../../models/upcoming_movies_model.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  DataRepositoryHome dataRepositoryHome;
  UpcomingMoviesBloc(this.dataRepositoryHome) : super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesEvent>(_OnUpcomingMoviesEvent);
  }

  void _OnUpcomingMoviesEvent(
      UpcomingMoviesEvent event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesLoading());
    try {
      final upcomingMovies = await dataRepositoryHome.getUpcomingMovies();
      emit(UpcomingMoviesSuccess(upcomingMovies));
    } catch (e) {
      emit(UpcomingMoviesFailure(e.toString()));
    }
  }
}
