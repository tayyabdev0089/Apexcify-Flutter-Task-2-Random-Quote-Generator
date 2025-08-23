import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<QuoteEntity> getRandomQuote();
}
