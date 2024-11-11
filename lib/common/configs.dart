import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configs {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String baseKey = dotenv.env['BASE_KEY']!;
}
