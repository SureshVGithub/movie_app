import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/l10n/bloc/localization_bloc.dart';
import 'package:movie_app/src/features/auth/bloc/login_validation_bloc.dart';
import 'package:movie_app/src/features/home/bloc/playing_movies/playing_movies_bloc.dart';
import 'package:movie_app/src/features/home/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/src/features/home/bloc/top_rated/bloc/top_rated_movies_bloc.dart';
import 'package:movie_app/src/features/home/bloc/upcoming_movies/bloc/upcoming_movies_bloc.dart';
import 'package:movie_app/src/features/home/data/data_repository.dart';
import 'package:movie_app/src/routing/go_routing.dart';
import 'package:movie_app/src/theme/bloc/theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.savedLanguage, required this.isDarkTheme});
  String savedLanguage;
  String isDarkTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayingMoviesBloc(DataRepositoryHome()),
        ),
        BlocProvider(
          create: (context) => PopularMoviesBloc(DataRepositoryHome()),
        ),
        BlocProvider(
          create: (context) => TopRatedMoviesBloc(DataRepositoryHome()),
        ),
        BlocProvider(
          create: (context) => UpcomingMoviesBloc(DataRepositoryHome()),
        ),
        BlocProvider(
          create: (context) => LoginValidationBloc(),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc()
            ..add(
              LoacalizationChanged(selectedLanguage: savedLanguage),
            ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()
            ..add(
              InitialThemeSetEvent(),
            ),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, language) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                //! router
                routerConfig: router,
                //! theme
                theme: theme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(language.selectedLanguage.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
