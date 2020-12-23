import 'package:flutter/material.dart';
import 'package:spoten_movies/home/movie.dart';
import 'package:spoten_movies/home/movie_details.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card${movie.id}',
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 7,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              movie.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFDC2626),
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                            ),
                            child: Image.network(
                              movie.fullImageUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            child: Flexible(
                              child: Text(
                                movie.overview == ''
                                    ? "Sorry, error on load movie's overview. Please try again later."
                                    : movie.overview,
                                maxLines: 5,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () async {
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.push(
                    context,
                    SlowMaterialPageRoute(
                      builder: (context) {
                        return new MovieDetails(movie: movie);
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlowMaterialPageRoute<T> extends MaterialPageRoute<T> {
  SlowMaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => const Duration(seconds: 1);
}
