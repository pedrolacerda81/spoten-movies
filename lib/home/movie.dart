import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  Movie({
    @required this.id,
    @required this.title,
    @required this.posterPath,
    @required this.overview,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Movie(
        id: map['id'],
        title: map['title'],
        posterPath: map['poster_path'],
        overview: map['overview']);
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  String get fullImageUrl => 'http://image.tmdb.org/t/p/w200$posterPath';
}
