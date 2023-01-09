import 'package:equatable/equatable.dart';

class NewsEntry extends Equatable{
  int? id;
  String? source;
  Null? author;
  String? title;
  String? description;
  String? content;
  String? publishedAt;
  List<String>? keywords;
  String? url;
  String? urlToImage;

  NewsEntry(
      {this.id,
        this.source,
        this.author,
        this.title,
        this.description,
        this.content,
        this.publishedAt,
        this.keywords,
        this.url,
        this.urlToImage});

  NewsEntry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    publishedAt = json['publishedAt'];
    keywords = json['keywords'].cast<String>();
    url = json['url'];
    urlToImage = json['urlToImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['publishedAt'] = this.publishedAt;
    data['keywords'] = this.keywords;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    return data;
  }

  @override
  List<Object?> get props => [id,source,author,title,description,content,publishedAt,keywords,url,urlToImage];
}