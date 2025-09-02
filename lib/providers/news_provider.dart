import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/models/article.dart';
import 'package:interview_app/services/news_service.dart';

final newsProvider = FutureProvider<List<Article>>((ref) async {
  final newsService = ref.watch(newsServiceProvider);
  return newsService.fetchNews();
});
