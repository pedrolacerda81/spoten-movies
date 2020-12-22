import 'package:flutter/material.dart';
import 'package:spoten_movies/src/features/home/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoten Movies',
      theme: ThemeData(
        primaryColor: Color(0xFF171717),
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //TODO:
    case '/movie-details':
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return Container();
        },
      );
      break;
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return Home();
        },
      );
      break;
  }
}
