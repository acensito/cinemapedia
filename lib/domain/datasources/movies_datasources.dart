import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasources {
  //trae la lista de las peliculas ahora en cartelera
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

}
