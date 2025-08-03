
import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl implements ActorsRepository {

  final ActorsDataSource actorsDataSource;

  ActorRepositoryImpl({required this.actorsDataSource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDataSource.getActorsByMovie(movieId);
  }

}
