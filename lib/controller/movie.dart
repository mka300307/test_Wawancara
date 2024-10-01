import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/movie.dart';

class MovieController extends GetxController {
  final String apiUrl = "https://mocki.io/v1/2581be9c-d8f0-4cad-8e8a-080a6657e55c";
  var movies = <Movie>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var movieResponse = MovieResponse.fromJson(json.decode(response.body));
        movies.assignAll(movieResponse.movies);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Movie? getMovieById(int id) {
    try {
      return movies.firstWhere((movie) => movie.id == id);
    } catch (e) {
      return null;
    }
  }
}
