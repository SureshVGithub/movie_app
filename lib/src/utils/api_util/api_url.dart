import 'package:movie_app/src/utils/api_util/api_base.dart';

class ApiUrl {
  static String playingNow = '$apiBase/movie/now_playing';
  static String popularMovies = '$apiBase/movie/popular';
  static String upcomingMovies = '$apiBase/movie/upcoming';
  static String topRatedMovies = '$apiBase/movie/top_rated';
  static String toGetNextPage =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=0df8e1f55cdcffa89c89c21e764c78e9&page=2';
}
