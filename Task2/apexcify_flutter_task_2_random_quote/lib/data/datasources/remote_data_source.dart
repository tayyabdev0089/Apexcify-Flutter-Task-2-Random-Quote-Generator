import 'dart:convert';
import 'package:apexcify_flutter_task_2_random_quote/core/network/api_client.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/models/quote_model.dart';

abstract class RemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSourceImpl({required this.apiClient});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiClient.getRandomQuote();
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
