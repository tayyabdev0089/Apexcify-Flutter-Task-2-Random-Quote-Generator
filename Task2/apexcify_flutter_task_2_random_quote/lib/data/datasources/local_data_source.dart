import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/models/quote_model.dart';

class LocalDataSource {
  Future<List<QuoteModel>> getAllQuotes() async {
    try {
      final String response = await rootBundle.loadString('Assets/quotes.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => QuoteModel.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error loading quotes: $e');
      return [];
    }
  }

  Future<QuoteModel> getRandomQuote() async {
    final allQuotes = await getAllQuotes();
    if (allQuotes.isEmpty) {
      throw Exception('No quotes found');
    }
    final randomIndex = DateTime.now().millisecond % allQuotes.length;
    return allQuotes[randomIndex];
  }
}
