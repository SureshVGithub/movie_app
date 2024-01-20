import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/utils/local_store/local_store.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState()) {
    on<LoacalizationChanged>(_onLocalizationChanged);
  }
  void _onLocalizationChanged(
      LoacalizationChanged event, Emitter<LocalizationState> emit) async {
    LocalStore localStore = LocalStore();
    localStore.setLanguageSelected(event.selectedLanguage);
    emit(LocalizationState(selectedLanguage: event.selectedLanguage));
  }
}
