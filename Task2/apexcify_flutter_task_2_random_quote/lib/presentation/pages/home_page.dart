import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/controllers/quote_controller.dart';

class HomePage extends GetView<QuoteController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              if (controller.quote.value != null) {
                SharePlus.instance.share(
                  ShareParams(text: '"${controller.quote.value!.content}" - ${controller.quote.value!.author}')
                    );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controller.quote.value != null) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Padding(
                key: ValueKey<String?>(controller.quote.value?.content),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '"${controller.quote.value!.content}"',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '- ${controller.quote.value!.author}',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text('No quote found.');
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchRandomQuote(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
