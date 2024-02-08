import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constaint/url_api.dart';

class GitHubRepository {
  Future<List<dynamic>> fetchData(String searchQuery) async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl + searchQuery),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['items'];
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data. Please try again later.');
    }
  }

  Future<List<dynamic>> fetchDataDetails(String branchesURL) async {
    try {
      final response = await http.get(Uri.parse(branchesURL));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          return jsonData;
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data. Please try again later.');
    }
  }
}
