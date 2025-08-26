import 'package:apexcify_flutter_task_2_random_quote/data/datasources/local_data_source.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final LocalDataSource localDataSource;

  QuoteRepositoryImpl({required this.localDataSource});

  @override
  Future<QuoteEntity> getRandomQuote() async {
    final quoteModel = await localDataSource.getRandomQuote();
    // Map QuoteModel to QuoteEntity, including isFavorite
    return QuoteEntity(
      content: quoteModel.content,
      author: quoteModel.author,
      isFavorite: quoteModel.isFavorite,
    );
  }
}
