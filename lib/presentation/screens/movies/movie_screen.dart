import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {

  static const String routeName = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: ${widget.movieId}'),
      ),
      body: Center(
        child: Text('Details for movie ID: ${widget.movieId}'),
      )
    );
  }
}
