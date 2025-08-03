import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //acciones al buscar
    return [
        FadeIn(
          animate: query.isNotEmpty,
          duration: Duration(milliseconds: 100),
          child: IconButton(onPressed: () => query = '', 
          icon: Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //el icono de regreso y que debe de hacer al ser pulsado
    //no retorna valor ninguno (null)
    return IconButton(onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions');
  }

}
