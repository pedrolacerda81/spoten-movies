import 'package:dio/dio.dart';

class DataSource {
  final Dio dio = Dio();

  DataSource() {
    dio.options.baseUrl = 'https://api.themoviedb.org';
  }
}
