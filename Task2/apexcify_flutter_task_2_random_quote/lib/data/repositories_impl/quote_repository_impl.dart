import 'package:apexcify_flutter_task_2_random_quote/data/datasources/remote_data_source.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final RemoteDataSource remoteDataSource;

  QuoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<QuoteEntity> getRandomQuote() async {
    final quoteModel = await remoteDataSource.getRandomQuote();
    return QuoteEntity(content: quoteModel.content, author: quoteModel.author);
  }
}
