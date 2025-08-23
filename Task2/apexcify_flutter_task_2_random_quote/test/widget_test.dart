
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:apexcify_flutter_task_2_random_quote/domain/entities/quote_entity.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/controllers/quote_controller.dart';
import 'package:apexcify_flutter_task_2_random_quote/presentation/pages/home_page.dart';
import 'mocks.mocks.dart';

void main() {
  late MockGetRandomQuote mockGetRandomQuote;

  setUp(() {
    mockGetRandomQuote = MockGetRandomQuote();
    Get.lazyPut<QuoteController>(() => QuoteController(getRandomQuote: mockGetRandomQuote));
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('App loads and displays a quote', (WidgetTester tester) async {
    // Arrange
    final quoteEntity = QuoteEntity(content: 'Test Quote', author: 'Test Author');
    when(mockGetRandomQuote.call()).thenAnswer((_) async => quoteEntity);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomePage(),
      ),
    );

    // Act
    await tester.pump();

    // Assert
    expect(find.text('"Test Quote"'), findsOneWidget);
    expect(find.text('- Test Author'), findsOneWidget);
  });
}
