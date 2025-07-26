import 'package:http/http.dart' as http;

Future<http.Response> getAccess() {
  return http.post(Uri.parse('https://api.intra.42.fr/oauth/token'));
}