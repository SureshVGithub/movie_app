import 'package:flutter/material.dart';
import 'package:movie_app/src/utils/local_store/local_store.dart';
import 'package:movie_app/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStore.initPref();
  LocalStore localStore = LocalStore();
  final String savedLanguage = localStore.getLanguageSelected() ?? 'en';
  final String savedTheme = localStore.getTheme() ?? 'false';
  print('savedLanguage: ${savedLanguage.toString()}');
  print('savedTheme: ${savedTheme.toString()}');

  runApp(MyApp(savedLanguage: savedLanguage, isDarkTheme: savedTheme));
}
