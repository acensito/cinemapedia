import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeWidget(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeWidget extends ConsumerStatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<_HomeWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();   
    ref.read(popularMoviesProvider.notifier).loadNextPage();  
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //cargamos las peliculas del provider
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    //este mostrara solo seis de las peliculas de la cartelera
    final slideShowMovies = ref.watch(moviesSlideshowprovider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(

      slivers: [
        
        SliverAppBar(
          floating: true,
            title: CustomAppbar(),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideShowMovies),

                MoviesHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Mejor valoradas',
                  subTitle: 'De todos los tiempos',
                  loadNextPage: () => ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares',
                  // subTitle: 'De todos los tiempos',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  // subTitle: 'De todos los tiempos',
                  loadNextPage: () => ref
                      .read(upcomingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ),
      ],
    );
  }
}
