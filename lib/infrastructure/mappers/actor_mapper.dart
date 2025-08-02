import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://previews.123rf.com/images/diddleman/diddleman1505/diddleman150500026/39789197-no-user-profile-picture-hand-drawn-illustration.jpg',
      character: cast.character ?? '',
    );
  }
}