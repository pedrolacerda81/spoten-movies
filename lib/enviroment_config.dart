import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnviromentConfig {
  // --dart-define=movieApiKey=MYKEY
  final movieApiKey = const String.fromEnvironment('movieApiKey');
}

final enviromentConfigProvider = Provider<EnviromentConfig>((ref) {
  return EnviromentConfig();
});
