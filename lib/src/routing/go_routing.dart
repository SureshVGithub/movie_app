import 'package:go_router/go_router.dart';
import 'package:movie_app/src/features/home/presentation/home.dart';
import 'package:movie_app/src/features/settings/settings.dart';

import '../features/auth/presentation/login.dart';
import '../features/home/presentation/movie_details_screen.dart';
import '../utils/local_store/local_store.dart';

final GoRouter router = GoRouter(
  initialLocation: (LocalStore().getEmail() == null) ? '/login' : '/',
  routes: [
    //login screen

    GoRoute(
      name: 'login',
      path: "/login",
      builder: (context, state) => const Login(),
    ),

    GoRoute(
      name: 'home',
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'settings',
      path: "/settings",
      builder: (context, state) => const Settings(),
    ),

    GoRoute(
      name: 'moviedetailscreen',
      path:
          "/moviedetailscreen/:backDropPath/:overview/:posterPath/:releaseDate/:title/:language",
      builder: (context, state) => MovieDetailsScreen(
        backDropPath: state.pathParameters['backDropPath']!,
        overview: state.pathParameters['overview']!,
        posterPath: state.pathParameters['posterPath']!,
        releaseDate: state.pathParameters['releaseDate']!,
        title: state.pathParameters['title']!,
        language: state.pathParameters['language']!,
      ),
    ),
  ],
);
