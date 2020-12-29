import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final dynamic popularity;

  Movie({
    @required this.id,
    @required this.title,
    @required this.posterPath,
    @required this.overview,
    @required this.popularity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'popularity': popularity,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Movie(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
      overview: map['overview'],
      popularity: map['popularity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  String get fullImageUrl => 'http://image.tmdb.org/t/p/w200$posterPath';
}
