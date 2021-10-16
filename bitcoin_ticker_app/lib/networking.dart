import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        //The json data is always converted into string for effective transmission of data.
        String body = response.body;

        //Parses the string and returns the resulting Json object
        Map<String, dynamic> decodedJson = jsonDecode(body);

        return decodedJson;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
