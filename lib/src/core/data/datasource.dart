import 'package:dio/dio.dart';
import 'package:spoten_movies/src/core/domain/data/abstract_datasource.dart';

class Datasource implements AbstractDatasource {
  final Dio dio = Dio();

  Datasource() {
    dio.options.baseUrl = 'https://vex.webvelit.com.br/api';
  }
}
