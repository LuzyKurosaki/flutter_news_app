part of 'news_entry_bloc.dart';


enum NewsStatus {initial, success, failure }


class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.newsEntries = const <NewsEntry>[],
    this.hasReachedMax = false,
  });

  final NewsStatus status;
  final List<NewsEntry> newsEntries;
  final bool hasReachedMax;

  NewsState copyWith({
    NewsStatus? status,
    List<NewsEntry>? newsEntries,
    bool? hasReachedMax,
    News
  }) {
    return NewsState(
      status: status ?? this.status,
      newsEntries: newsEntries ?? this.newsEntries,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
  @override
  String toString() {
    return '''NewsEntryState { status: $status, hasReachedMax: $hasReachedMax, newsEntries: ${newsEntries.length} }''';
  }
  @override
  List<Object> get props => [status, newsEntries, hasReachedMax];
}