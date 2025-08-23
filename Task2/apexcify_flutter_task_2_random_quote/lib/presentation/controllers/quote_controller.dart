import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/usecases/get_random_quote.dart';

class QuoteController extends GetxController {
  final GetRandomQuote getRandomQuote;

  QuoteController({required this.getRandomQuote});

  final quote = Rx<QuoteEntity?>(null);
  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchRandomQuote();
  }

  void fetchRandomQuote() async {
    isLoading.value = true;
    try {
      final result = await getRandomQuote();
      quote.value = result;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
