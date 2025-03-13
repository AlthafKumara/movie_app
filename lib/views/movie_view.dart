import 'package:app_movie/models/response_data_list.dart';
import 'package:app_movie/services/movie.dart';
import 'package:app_movie/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  MovieService movie = MovieService();
  List? film;

  getFilm() async {
    ResponseDataList getMovie = await movie.getMovie();
    setState(() {
      film = getMovie.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: film != null
          ? ListView.builder(
              itemCount: film!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading:
                        Image(image: NetworkImage(film![index].posterPath)),
                    title: Text(film![index].title),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
