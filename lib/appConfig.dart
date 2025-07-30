import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // static const because values came from .env at the compilation
  static final String apiUrl = dotenv.get('URL');
  static final String clientSecret = dotenv.get('CLIENT_SECRET');
  static final String clientId = dotenv.get('CLIENT_ID');
}