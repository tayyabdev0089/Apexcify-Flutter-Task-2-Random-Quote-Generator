import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/controllers/quote_controller.dart';

class FavoriteQuotesPage extends GetView<QuoteController> {
  const FavoriteQuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Quotes'),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.favoriteQuotes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.favoriteQuotes.isEmpty) {
          return const Center(child: Text('No favorite quotes yet.'));
        } else {
          return ListView.builder(
            itemCount: controller.favoriteQuotes.length,
            itemBuilder: (context, index) {
              final quote = controller.favoriteQuotes[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${quote.content}"',
                        style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '- ${quote.author}',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: quote.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            controller.toggleFavorite(quote);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
