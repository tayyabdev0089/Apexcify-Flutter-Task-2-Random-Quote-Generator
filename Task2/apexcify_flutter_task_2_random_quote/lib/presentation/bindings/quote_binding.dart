import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/datasources/local_data_source.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/repositories_impl/quote_repository_impl.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/repositories/quote_repository.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/usecases/get_random_quote.dart'; // Import GetRandomQuote
import 'package:apexcify_flutter_task_2_random_quote/presentation/controllers/quote_controller.dart';

class QuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalDataSource());
    Get.lazyPut<QuoteRepository>(() => QuoteRepositoryImpl(localDataSource: Get.find()));
    Get.lazyPut(() => GetRandomQuote(Get.find<QuoteRepository>())); // Provide GetRandomQuote
    Get.lazyPut(() => QuoteController(getRandomQuoteUseCase: Get.find())); // Inject GetRandomQuote
  }
}
