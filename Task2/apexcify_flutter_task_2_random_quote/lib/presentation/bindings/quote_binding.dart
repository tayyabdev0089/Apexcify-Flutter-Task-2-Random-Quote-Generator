import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/core/network/api_client.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/datasources/remote_data_source.dart';
import 'package:apexcify_flutter_task_2_random_quote/data/repositories_impl/quote_repository_impl.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/repositories/quote_repository.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/usecases/get_random_quote.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/controllers/quote_controller.dart';

class QuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(apiClient: Get.find()));
    Get.lazyPut<QuoteRepository>(() => QuoteRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => GetRandomQuote(Get.find()));
    Get.lazyPut(() => QuoteController(getRandomQuote: Get.find()));
  }
}
