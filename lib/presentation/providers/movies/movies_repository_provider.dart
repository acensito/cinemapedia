

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repository/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider de solo lectura, inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MovieDBDatasource());
});