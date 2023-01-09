
import 'package:dio/dio.dart';
import 'package:news_app/news_articles/Resources/provider/interfaces/news_entry_api_provider.dart';
import 'package:news_app/news_articles/models/news_entry.dart';
import 'package:news_app/services/api_service.dart';

class NewsEntryRest implements NewsEntryApiProvider{

  Future<List<NewsEntry>> fetchPage({page = 0}) async{
    ApiService apiService = ApiService("https://newsapi.6min4you.de/api/");
    Map<String, int> params = <String, int>{"page": page};
    Response<dynamic> response = await apiService.get("/get/true/news",  params: params);

    List<NewsEntry> data = <NewsEntry>[];
    response.data['data'].forEach((v) {
      data.add(new NewsEntry.fromJson(v));
    });
    return data;
  }
}
