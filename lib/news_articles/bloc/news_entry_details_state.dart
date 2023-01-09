part of 'news_entry_details_bloc.dart';

class NewsEntryDetailsState extends Equatable{

  const NewsEntryDetailsState({required this.newsEntry});
  final NewsEntry newsEntry;

  NewsEntryDetailsState copyWith({required NewsEntry newsEntry}) {
    return NewsEntryDetailsState(
        newsEntry: newsEntry
    );
  }
  @override
  List<Object?> get props => [newsEntry];
}