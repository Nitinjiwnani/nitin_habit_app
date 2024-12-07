import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nitin_habit_app/domain/model/quotes_model.dart';

class QuotesRepository {
  Future<List<Quotes>> fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        final quotesList = body['quotes'] as List<dynamic>;
        return quotesList.map((e) => Quotes.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch quotes: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Network Error: Unable to fetch quotes.');
    } on TimeoutException {
      throw Exception('Timeout: Unable to fetch quotes.');
    } catch (e) {
      throw Exception('Error fetching quotes: $e');
    }
  }
}
