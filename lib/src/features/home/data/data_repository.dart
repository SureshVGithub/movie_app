import 'dart:convert';
import 'package:movie_app/src/utils/api_util/api_url.dart';
import '../../../utils/api_util/api_headers.dart';
import '../models/playing_now_model.dart';
import 'package:http/http.dart' as http;
import '../models/popular_movies_model.dart';
import '../models/top_rated_movies_model.dart';
import '../models/upcoming_movies_model.dart';

class DataRepositoryHome {
  Future<PlayingNowModel> getPlayingMovies() async {
    try {
      final res =
          await http.get(Uri.parse(ApiUrl.playingNow), headers: headers);

      if (res.statusCode == 200) {
        return PlayingNowModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load Movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PopularMoviesModel> getPopularMovies() async {
    try {
      final res =
          await http.get(Uri.parse(ApiUrl.popularMovies), headers: headers);
      if (res.statusCode == 200) {
        return PopularMoviesModel.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load popular Movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<TopRatedMovies> getTopRatedMovies() async {
    try {
      final res =
          await http.get(Uri.parse(ApiUrl.topRatedMovies), headers: headers);

      if (res.statusCode == 200) {
        return TopRatedMovies.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load popular Movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UpcomingMovies> getUpcomingMovies() async {
    try {
      final res =
          await http.get(Uri.parse(ApiUrl.upcomingMovies), headers: headers);

      if (res.statusCode == 200) {
        return UpcomingMovies.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load popular Movies');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
