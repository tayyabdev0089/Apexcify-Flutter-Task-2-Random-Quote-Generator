class QuoteEntity {
  final String content;
  final String author;
  final bool isFavorite;

  QuoteEntity({required this.content, required this.author, this.isFavorite = false});

  // Add copyWith method
  QuoteEntity copyWith({
    String? content,
    String? author,
    bool? isFavorite,
  }) {
    return QuoteEntity(
      content: content ?? this.content,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
