import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/models/article.dart';
import 'package:interview_app/services/secure_storage_service.dart';

class NewsService {
  final Dio _dio;
  final SecureStorageService _secureStorage;

  NewsService(this._dio, this._secureStorage);

  Future<List<Article>> fetchNews() async {
    try {
      final apiKey = await _secureStorage.read('api_key');
      if (apiKey == null) {
        throw Exception('API key not found');
      }

      final response = await _dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'q': 'tesla',
          'from': '2024-09-01',
          'sortBy': 'publishedAt',
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles'];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}

final dioProvider = Provider<Dio>((ref) => Dio());

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService(ref.watch(dioProvider), ref.watch(secureStorageServiceProvider));
});
