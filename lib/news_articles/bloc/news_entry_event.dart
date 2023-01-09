
part of 'news_entry_bloc.dart';


abstract class NewsEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class NewsEntriesFetched extends NewsEvent {}

class NavigateDetails extends NewsEvent {}