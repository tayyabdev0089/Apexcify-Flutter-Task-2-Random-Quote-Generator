class QuoteModel {
  final String content;
  final String author;
  final bool isFavorite;

  QuoteModel({required this.content, required this.author, this.isFavorite = false});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      content: json['content'],
      author: json['author'],
      isFavorite: json['isFavorite'] ?? false, // Default to false if not present
    );
  }
}
