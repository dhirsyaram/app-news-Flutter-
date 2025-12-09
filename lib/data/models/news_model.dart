import 'package:intl/intl.dart';

class NewsModel {
  final String title;
  final String? description;
  final List<String>? author;
  final String? content;
  final String? imageUrl;
  final String source;
  final String date;

  NewsModel({
    required this.title,
    this.description,
    this.author,
    this.content,
    this.imageUrl,
    required this.source,
    required this.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'],
      author: json['author'] != null
          ? (json['author'] as String).split(',').map((e) => e.trim()).toList()
          : null,
      content: json['content'],
      imageUrl: json['urlToImage'],
      source: json['source']?['name'] ?? 'Unknown',
      date: json['publishedAt'] ?? '',
    );
  }

  String get formatTitle {
    return title.split(" - ").first;
  }

  String get formattedDate {
    try {
      return DateFormat("dd MMM yyyy").format(DateTime.parse(date));
    } catch (_) {
      return date;
    }
  }

  String get formatAuthorDisplay {
    if (author == null || author!.isEmpty) return "Unknown";

    final firstAuthor = author!.first.trim();
    final words = firstAuthor.split(' ');

    final shortName = words.length >= 2
        ? "${words[0]} ${words[1]}"
        : words.first;

    return author!.length > 1 ? "$shortName, etc." : shortName;
  }
}
