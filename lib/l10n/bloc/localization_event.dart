part of 'localization_bloc.dart';

class LocalizationEvent {}

class LoacalizationChanged extends LocalizationEvent {
  String selectedLanguage;
  LoacalizationChanged({
    required this.selectedLanguage,
  });
}
