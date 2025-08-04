import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10) ,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_creation_outlined, color: colors.primary),
              const SizedBox(),
              Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary)),
              const Spacer(),
      
              IconButton(
                onPressed: () {

                  final movieRepository = ref.read(movieRepositoryProvider);

                  final navigator = GoRouter.of(context);
                  //la busqueda devuelve una pelicula si existiera
                  showSearch<Movie?>(
                    context: context,
                    delegate: SearchMovieDelegate(searchMovies: movieRepository.searchMovies)
                    //si existe, navega hasta la pelicula concreta
                  ).then((movie) {
                    if (movie == null) return;
                    navigator.push('/movie/${movie.id}');
                  });

                }, 
                icon: Icon(Icons.search)
              )
            ],
          ),
        ),
      
      ));
  }
}