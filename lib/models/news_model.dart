import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getNews() async {
  // URL for the news API endpoint
  final String uri =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=492cea89686a4a0cbd038b1015ad08c3';

  // Make a GET request to the API endpoint
  var response = await http.get(Uri.parse(uri));

  // Check if the response was successful
  if (response.statusCode == 200) {
    // Decode the JSON data from the response
    var data = jsonDecode(response.body);
    // Return the list of articles from the API
    return data['articles'];
  } else {
    // If the response was not successful, throw an error
    throw Exception('Failed to fetch news');
  }
}
