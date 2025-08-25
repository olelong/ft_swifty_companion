import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String apiUrl = dotenv.get('URL');
  static final String clientSecret = dotenv.get('CLIENT_SECRET');
  static final String clientId = dotenv.get('CLIENT_ID');
}