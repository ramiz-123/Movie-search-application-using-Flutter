// screens/home.dart
import 'package:flutter/material.dart';
import 'package:movie_search_app/models/movie.dart';
import 'package:movie_search_app/services/movie_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadTopRatedMovies();
  }

  Future<void> _loadTopRatedMovies() async {
    final moviesData = await _movieService.getTopRatedMovies();
    final movies = moviesData.map((data) {
      return Movie(
        id: data['id'],
        title: data['title'],
        posterPath: data['poster_path'],
        releaseDate: data['release_date'],
        imdbRating: data['vote_average'].toDouble(),
      );
    }).toList();

    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ListTile(
            leading: Image.network(
              'https://image.tmdb.org/t/p/w185/${movie.posterPath}',
              width: 60,
              height: 90,
            ),
            title: Text(movie.title),
            subtitle: Text(
              'Year: ${movie.releaseDate.substring(0, 4)} | IMDb: ${movie.imdbRating}',
            ),
          );
        },
      ),
    );
  }
}
