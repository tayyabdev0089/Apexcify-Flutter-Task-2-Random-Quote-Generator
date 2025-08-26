import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/bindings/quote_binding.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: QuoteBinding(),
      home: HomePage(),
    );
  }
}
