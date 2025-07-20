import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  //trae la lista de las peliculas ahora en cartelera
  Future<List<Movie>> getNowPlaying({int page = 1});



}