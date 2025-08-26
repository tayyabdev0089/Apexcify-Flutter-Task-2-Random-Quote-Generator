import 'dart:convert';
import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/usecases/get_random_quote.dart';

class QuoteController extends GetxController {
  final GetRandomQuote getRandomQuoteUseCase;

  QuoteController({required this.getRandomQuoteUseCase});

  final currentQuote = Rx<QuoteEntity?>(null);
  final isLoading = RxBool(false);
  final allQuotes = RxList<QuoteEntity>(); // To hold all quotes for favorite functionality

  @override
  void onInit() {
    super.onInit();
    fetchRandomQuote();
  }

  Future<void> fetchRandomQuote() async {
    isLoading.value = true;
    try {
      final quote = await getRandomQuoteUseCase();
      currentQuote.value = quote;
      // Ensure allQuotes is populated for toggleFavorite to work
      // This might need to be refactored if allQuotes is only for local management
      if (!allQuotes.any((q) => q.content == quote.content && q.author == quote.author)) {
        allQuotes.add(quote);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load quote: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(QuoteEntity quote) {
    final index = allQuotes.indexWhere((q) => q.content == quote.content && q.author == quote.author);
    if (index != -1) {
      final updatedQuote = allQuotes[index].copyWith(isFavorite: !allQuotes[index].isFavorite);
      allQuotes[index] = updatedQuote;
      if (currentQuote.value?.content == quote.content && currentQuote.value?.author == quote.author) {
        currentQuote.value = updatedQuote; // Update current quote if it's the one favorited
      }
      saveQuotes(); // Save after toggling favorite
    }
  }

  void addQuote(String content, String author) {
    final newQuote = QuoteEntity(content: content, author: author, isFavorite: false);
    allQuotes.add(newQuote);
    saveQuotes(); // Save after adding a new quote
  }

  String saveQuotes() {
    try {
      final jsonString = jsonEncode(allQuotes.map((quote) => {
        'content': quote.content,
        'author': quote.author,
        'isFavorite': quote.isFavorite,
      }).toList());
      return jsonString;
    } catch (e) {
      Get.snackbar('Error', 'Failed to prepare quotes for saving: ${e.toString()}');
      return '[]'; // Return empty JSON array on error
    }
  }
}
