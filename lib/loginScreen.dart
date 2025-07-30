import 'dart:convert' as convert;
import 'package:http/http.dart' as http;



final String apiUrl = dotenv.get('URL');
final String clientSecret = dotenv.get('CLIENT_SECRET');
final String clientId = dotenv.get('CLIENT_ID');

@override
void initState() {
  super.initState();
  getAccessToken();
}

Future<void> getAccessToken() async {
  final url = Uri.parse(apiUrl + "/oauth/token");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic>data = convert.json.deccode(response.body);
    setState(() {
      data.map((data) => userInformation.fromJson(data)).toList();
    });
    print(data);
  }
  else
    print("Failed to get access");
}