import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/models/news_entry.dart';

part 'news_entry_details_state.dart';
part 'news_entry_details_event.dart';

class NewsEntryDetailsBloc extends Bloc<NewsEntryDetailsEvent, NewsEntryDetailsState>{
  NewsEntryDetailsBloc({
    required NewsEntry newsEntry
  }) : super(
    NewsEntryDetailsState(newsEntry: newsEntry)
  );

}