

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/bloc/news_entry_bloc.dart';
import 'package:news_app/news_articles/widgets/bottom_loader.dart';
import 'package:news_app/news_articles/widgets/news_entry_list_item.dart';

class NewsEntryList extends StatefulWidget {
  const NewsEntryList({super.key});

  @override
  State<NewsEntryList> createState() => _NewsEntryListState();

}

class _NewsEntryListState extends State<NewsEntryList>{
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        switch (state.status) {
          case NewsStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case NewsStatus.success:
            if (state.newsEntries.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.newsEntries.length
                    ? const BottomLoader()
                    : NewsEntryListItem(newsEntry: state.newsEntries[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.newsEntries.length
                  : state.newsEntries.length + 1,
              controller: _scrollController,
            );
          case NewsStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NewsBloc>().add(NewsEntriesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}