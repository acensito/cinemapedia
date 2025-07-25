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
  }

  @override
  Widget build(BuildContext context) {
    //cargamos las peliculas del provider
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    //este mostrara solo seis de las peliculas de la cartelera
    final slideShowMovies = ref.watch(moviesSlideshowprovider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        CustomAppbar(),

        MoviesSlideshow(movies: slideShowMovies),

        MoviesHorizonatlListView(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Lunes 20',
        ),
      ],
    );
  }
}
