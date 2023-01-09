

import 'package:news_app/news_articles/models/news_entry.dart';

abstract class NewsEntryApiProvider {
  Future<List<NewsEntry>> fetchPage({page});
}