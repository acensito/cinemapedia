import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource extends MoviesDatasources {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.apiTMDBKey, 'language': 'es-ES'},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );

    final movieBDResponse = MovieDBResponse.fromJson(response.data);

    final List<Movie> movies = movieBDResponse.results
    //condicion para filtrar las peliculas que no tienen poster
    //posterPath es el campo que contiene la url del poster de la pelicula
    .where((movieDB) => movieDB.posterPath != 'no-poster')
    .map(
      (movieDB) => MovieMapper.movieDBToEntity(movieDB)
    ).toList();

    return movies;
  }
}
