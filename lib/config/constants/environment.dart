import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiTMDBKey = dotenv.env['THEMOVIEDB_API_KEY'] ?? 'No hay api Key definida';
}