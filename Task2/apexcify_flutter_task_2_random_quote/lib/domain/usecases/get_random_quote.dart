import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote {
  final QuoteRepository repository;

  GetRandomQuote(this.repository);

  Future<QuoteEntity> call() async {
    return await repository.getRandomQuote();
  }
}
