import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spoten_movies/home/coment_listtile.dart';
import 'package:spoten_movies/home/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  final Random random = Random();

  MovieDetails({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card${movie.id}',
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              fontFamily: 'Raleway',
              letterSpacing: 0.5,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Image.network(
                    movie.fullImageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  movie.overview == ''
                      ? "Sorry, couldn't load movie's overview 😰"
                      : movie.overview,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      ComentListTile(
                        random: random,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
