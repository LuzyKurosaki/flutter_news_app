import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/Resources/provider/interfaces/news_entry_api_provider.dart';
import 'package:news_app/news_articles/Resources/provider/news_entry_rest.dart';
import 'package:news_app/news_articles/Resources/repositories/news_entry_repository.dart';
import 'package:news_app/news_articles/models/news_entry.dart';
import 'package:stream_transform/stream_transform.dart';

part 'news_entry_event.dart';
part 'news_entry_state.dart';

const throttleDuration = Duration(milliseconds: 100);


//Event Transformer to throttle events
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events.throttle(throttleDuration).switchMap(mapper);
  };
}

class NewsBloc extends Bloc<NewsEvent,NewsState> {

  NewsBloc({required this.newsEntryRepository}) : super (const NewsState()){
    _page = 0;
    // subcribe to event
    on<NewsEntriesFetched>(
        _onNewsEntryFetched,
        transformer: throttleDroppable(throttleDuration)
    );
  }

  late int _page;
  final NewsEntryRepository newsEntryRepository;

  //event handler
  Future<void> _onNewsEntryFetched(NewsEntriesFetched event, Emitter<NewsState> emit) async{
    if(state.hasReachedMax) return;
    try{
      if(state.status == NewsStatus.initial){
        final newsEntries = await newsEntryRepository.fetchPage(page: _page);
        _page++;
        return emit(state.copyWith(
          status: NewsStatus.success,
          newsEntries: newsEntries,
          hasReachedMax: false
        ));
      }
      final newsEntries = await newsEntryRepository.fetchPage(page: _page);
      _page++;
      newsEntries.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(state.copyWith(
          status: NewsStatus.success,
          newsEntries: List.of(state.newsEntries)..addAll(newsEntries),
          hasReachedMax: false
        ));
    }catch(_){
      emit(state.copyWith(status: NewsStatus.failure));
    }
  }

}