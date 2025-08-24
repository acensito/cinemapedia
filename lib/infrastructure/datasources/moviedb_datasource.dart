import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_detail.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource extends MoviesDatasources {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.apiTMDBKey, 'language': 'es-ES'},
    ),
  );

  //metodo que convierte el json a una lista de peliculas
  //se usa el mapper para convertir el json a una entidad de pelicula
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieBDResponse = MovieDBResponse.fromJson(json);

    final List<Movie> movies = movieBDResponse.results
        //condicion para filtrar las peliculas que no tienen poster
        //posterPath es el campo que contiene la url del poster de la pelicula
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String movieId) async {
    final response = await dio.get('/movie/$movieId');
    if (response.statusCode != 200) {
      throw Exception('Error al obtener la pelicula con id: $movieId');
    }
    final movieDB = MovieDetail.fromJson(response.data);
    return MovieMapper.movieDetailToEntity(movieDB);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {

    if ( query.isEmpty ) return [];
    
    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );

    return _jsonToMovies(response.data);
  }
}
