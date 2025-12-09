import 'package:app_news_flutter/data/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailView extends StatelessWidget {
  final NewsModel news;

  const NewsDetailView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.imageUrl != null)
              Image.network(news.imageUrl!, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(news.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text("By ${news.author ?? "Unknown"}"),
            const SizedBox(height: 8),
            Text(news.description ?? "No Description"),
          ],
        ),
      ),
    );
  }
}
