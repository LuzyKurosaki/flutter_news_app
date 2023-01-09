
import 'package:news_app/news_articles/Resources/provider/interfaces/news_entry_api_provider.dart';
import 'package:news_app/news_articles/models/news_entry.dart';


class NewsEntryRepository{

  const NewsEntryRepository({
    required NewsEntryApiProvider newsEntryApi
  }) : _newsEntryApi = newsEntryApi;

  final NewsEntryApiProvider _newsEntryApi;

  Future<List<NewsEntry>> fetchPage({page = 0}) => _newsEntryApi.fetchPage(page: page);

}